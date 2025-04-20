package net.empathetech.sos

import android.app.Application
import android.content.Context
import android.telephony.SmsManager
import android.util.Log
import androidx.annotation.NonNull
import androidx.work.Configuration
import androidx.work.CoroutineWorker
import androidx.work.ExistingPeriodicWorkPolicy
import androidx.work.ListenableWorker
import androidx.work.PeriodicWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.WorkerFactory
import androidx.work.WorkerParameters
import androidx.work.workDataOf
import com.google.android.gms.location.FusedLocationProviderClient
import com.google.android.gms.location.LocationServices
import com.google.android.gms.location.Priority
import com.google.android.gms.tasks.Tasks
import java.util.concurrent.TimeUnit
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
  private val CHANNEL = "net.empathetech.sos/broadcast"

  // Init foreground SOS
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
      call, result ->
      when (call.method) {
        "foregroundSOS" -> {
          val recipients = call.argument<String?>("recipients") ?: ""
          val message = call.argument<String?>("message") ?: ""
          sendSMS(result, recipients, message)
        } 
        "backgroundSOS" -> {
          val recipients = call.argument<String?>("recipients") ?: ""
          val heading = call.argument<String?>("heading") ?: ""

          val workRequest = PeriodicWorkRequestBuilder<SOSWorker>(15L, TimeUnit.MINUTES)
            .setInputData(workDataOf("recipients" to recipients, "heading" to heading))
            .build()

          WorkManager.getInstance(this).enqueueUniquePeriodicWork(
            "periodicSOS",
            ExistingPeriodicWorkPolicy.REPLACE,
            workRequest
          )
          result.success("Periodic SOS scheduled")
        }
        "cancelBackgroundSOS" -> { 
          WorkManager.getInstance(this).cancelUniqueWork("periodicSOS")
          result.success("Periodic SOS cancelled")
        }
        else -> result.notImplemented()        
      } 
    }
  }

  // Send foreground SOS
  private fun sendSMS(result: MethodChannel.Result, recipients: String, message: String) {
    val numbers = recipients.split(";")
    val failures = mutableListOf<String>()

    val smsManager = SmsManager.getDefault()
    for (num in numbers) {
      try {
        Log.d("SMS_PROGRESS", "Sending SOS to $num")
        smsManager.sendTextMessage(num, null, message, null, null)
      } catch (e: Exception) {
        failures.add(num)
      }
    }

    if (failures.isEmpty()) {
      result.success("SMS_SUCCESS")
    } else {
      result.error(
        "SMS_FAILURES_DETECTED",
        "Failed to send to: ${failures.joinToString(", ")}",
        null
      )
    }
  }
}

class MainApplication : Application(), Configuration.Provider {
  override val workManagerConfiguration: Configuration
    get() = Configuration.Builder()
      .setWorkerFactory(SOSFactory())
      .build()

  // Init background SOS I
  override fun onCreate() {
    super.onCreate()
    WorkManager.initialize(this, workManagerConfiguration)
  }
}

class SOSFactory : WorkerFactory() {
  // Init background SOS II
  override fun createWorker(
    appContext: Context,
    workerClassName: String,
    workerParams: WorkerParameters
  ): ListenableWorker? {
    return when (workerClassName) {
      SOSWorker::class.java.name -> SOSWorker(appContext, workerParams)
      else -> null
    }
  }
}

class SOSWorker(appContext: Context, workerParams: WorkerParameters) : CoroutineWorker(appContext, workerParams) {

  private val fusedLocationClient: FusedLocationProviderClient = 
    LocationServices.getFusedLocationProviderClient(appContext)

  // Send background SOS
  override suspend fun doWork(): Result {
    val recipients = inputData.getString("recipients") ?: return Result.failure()
    val numbers = recipients.split(";")
    val failures = mutableListOf<String>()

    val locationString = try {
      fetchLocation()
    } catch (e: SecurityException) {
      Log.d("LOCATION_ERROR", "Permission denied: ${e.message}")
      "Location unavailable."
    } catch (e: Exception) {
      Log.d("LOCATION_ERROR", "Fetch failure: ${e.message}")
      "Location unavailable."
    }

    val heading = inputData.getString("heading") ?: "SOS"
    val message = "$heading\n$locationString"

    val smsManager = SmsManager.getDefault()
    for (num in numbers) {
      try {
        Log.d("SMS_PROGRESS", "Periodic SOS to $num")
        smsManager.sendTextMessage(num, null, message, null, null)
      } catch (e: Exception) {
        Log.d("SMS_ERROR", "Failed to send to $num: ${e.message}")
        failures.add(num)
      }
    }

    return if (failures.isEmpty()) {
      Result.success()
    } else {
      Result.failure()
    }
  }

  private suspend fun fetchLocation(): String {
    return withContext(Dispatchers.IO) {
      try {
        val location = Tasks.await(fusedLocationClient.lastLocation) 

        if (location != null) {
          "https://www.google.com/maps?q=${location.latitude},${location.longitude}"
        } else {
          Log.d("LOCATION_ERROR", "FusedLocationProviderClient returned null.")  
          "Location unavailable."
        }
      } catch (e: SecurityException) {
        Log.d("LOCATION_ERROR", "SecurityException during fetch: ${e.message}")
        throw e 
      } catch (e: Exception) {
        Log.d("LOCATION_ERROR", "Exception during fetch: ${e.message}")
        "Location unavailable."
      }
    }
  }
}
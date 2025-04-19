package net.empathetech.sos

import android.app.Application
import android.content.Context
import android.telephony.SmsManager
import android.util.Log
import androidx.annotation.NonNull
import androidx.work.Configuration
import androidx.work.ListenableWorker
import androidx.work.Worker
import androidx.work.WorkManager
import androidx.work.WorkerFactory
import androidx.work.WorkerParameters
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
      if (call.method == "sendSOS") {
        val recipients = call.argument<String?>("recipients") ?: ""
        val message = call.argument<String?>("message") ?: ""
        sendSMS(result, recipients, message)
      } else {
        result.notImplemented()
      }
    }
  }

  // Send foreground SOS
  private fun sendSMS(result: MethodChannel.Result, recipients: String, message: String) {
    val smsManager = SmsManager.getDefault()
    val numbers = recipients.split(";")
    val failures = mutableListOf<String>()

    for (num in numbers) {
      try {
        android.util.Log.d("SMS_PROGRESS", "Sending SOS to $num")
        smsManager.sendTextMessage(num, null, message, null, null)
      } catch (e: Exception) {
        android.util.Log.d("SMS_ERROR", "Failed to send to $num: ${e.message}")
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
    workerParameters: WorkerParameters
  ): ListenableWorker? {
    return when (workerClassName) {
      SOSWorker::class.java.name -> SOSWorker(appContext, workerParameters)
      else -> null
    }
  }
}

class SOSWorker(appContext: Context, workerParams: WorkerParameters) : Worker(appContext, workerParams) {
  // Send background SOS
  override fun doWork(): Result {
    val recipients = inputData.getString("recipients") ?: return Result.failure()
    val message = inputData.getString("message") ?: return Result.failure()
    val location = inputData.getString("location") ?: return Result.failure()

    val smsManager = SmsManager.getDefault()
    val numbers = recipients.split(";")
    val failures = mutableListOf<String>()

    for (num in numbers) {
      try {
        Log.d("SMS_PROGRESS", "Sending SOS to $num")
        val parts = smsManager.divideMessage("$message\n$location")
        smsManager.sendMultipartTextMessage(num, null, parts, null, null)
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
}
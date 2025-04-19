package net.empathetech.sos

import android.util.Log
import androidx.work.Worker
import android.content.Context
import android.telephony.SmsManager
import androidx.work.WorkerParameters

class SOSFactory : WorkerFactory() {
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
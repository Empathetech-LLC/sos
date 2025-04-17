package net.empathetech.sos

import androidx.work.Worker
import android.content.Context
import android.telephony.SmsManager
import androidx.work.WorkerParameters

class SendSOSWorker(context: Context, workerParams: WorkerParameters) : Worker(context, workerParams) {
  override fun doWork(): Result {
    val recipients = inputData.getString("recipients") ?: return Result.failure()
    val message = inputData.getString("message") ?: return Result.failure()
    val location = inputData.getString("location") ?: return Result.failure()

    val smsManager = SmsManager.getDefault()
    val numbers = recipients.split(";")
    val failures = mutableListOf<String>()

    for (num in numbers) {
      try {
        val parts = smsManager.divideMessage("$message\n$location")
        smsManager.sendMultipartTextMessage(num, null, parts, null, null)
      } catch (e: Exception) {
        android.util.Log.e("SMS_ERROR", "Failed to send to $num: ${e.message}")
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
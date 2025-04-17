package net.empathetech.sos

import androidx.work.Worker
import android.content.Context
import android.telephony.SmsManager
import androidx.work.WorkerParameters

class SendSOSWorker(context: Context, workerParams: WorkerParameters) : Worker(context, workerParams) {
  override fun doWork(): Result {
    val recipients = inputData.getString("recipients") ?: return Result.failure("MISSING_RECIPIENTS")
    val message = inputData.getString("message") ?: return Result.failure("MISSING_MESSAGE")

    val smsManager = SmsManager.getDefault()
    val numbers = recipients.split(";")
    val failures = mutableListOf<String>()

    for (num in numbers) {
      try {
        smsManager.sendTextMessage(num, null, message, null, null)
      } catch (e: Exception) {
        android.util.Log.e("SMS_ERROR", "Failed to send to $num: ${e.message}")
        failures.add(num)
      }
    }

    return if (failures.isEmpty()) {
      Result.success("SMS_SUCCESS")
    } else {
      Result.failure(
        "SMS_FAILURES_DETECTED",
        "Failed to send to: ${failures.joinToString(", ")}",
        null
      )
    }
  }
}
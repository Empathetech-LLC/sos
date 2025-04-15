package net.empathetech.sos

import androidx.annotation.NonNull
import android.telephony.SmsManager
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
  private val CHANNEL = "net.empathetech.sos/broadcast"

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
      call, result ->
      if (call.method == "sendSOS") {
        val message = call.argument<String?>("message") ?: ""
        val recipients = call.argument<String?>("recipients") ?: ""
        sendSMS(result, recipients, message)
      } else {
        result.notImplemented()
      }
    }
  }

  private fun sendSMS(result: MethodChannel.Result, recipients: String, message: String) {
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

    if (failures.isEmpty()) {
      result.success("SMS_SUCCESS")
    } else {
      result.error(
        "SMS_PARTIAL_FAILURE",
        "Failed to send to: ${failures.joinToString(", ")}",
        null
      )
    }
  }
}

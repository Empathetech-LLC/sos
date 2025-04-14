package net.empathetech.sos

import android.content.Intent
import android.app.PendingIntent
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
    val sentIntent = PendingIntent.getBroadcast(activity, 0, Intent("SMS_SENT_ACTION"), PendingIntent.FLAG_IMMUTABLE)
    val smsManager = SmsManager.getDefault()
    val numbers = recipients.split(";")

    for (num in numbers) {
      if (message.toByteArray().size > 80) {
        val partMessage = smsManager.divideMessage(message)
        smsManager.sendMultipartTextMessage(num, null, partMessage, null, null)
      } else {
        smsManager.sendTextMessage(num, null, message, sentIntent, null)
      }
    }

    result.success("SMS Sent!")
  }
}

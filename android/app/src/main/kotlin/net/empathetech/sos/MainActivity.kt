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

    for (num in numbers) {
      smsManager.sendTextMessage(num, null, message, null, null)
    }

    result.success("sendSMS successful")
  }
}

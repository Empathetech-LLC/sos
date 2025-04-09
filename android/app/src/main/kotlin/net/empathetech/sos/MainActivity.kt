package com.example.flutter_sms

import android.app.Activity
import android.app.PendingIntent
import android.content.Intent
import android.telephony.SmsManager
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class FlutterSmsPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var mChannel: MethodChannel
    private var activity: Activity? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        mChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_sms")
        mChannel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        mChannel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "sendSMS") {
            val message = call.argument<String>("message") ?: ""
            val recipients = call.argument<String>("recipients") ?: ""
            sendSMSDirect(result, recipients, message)
        } else {
            result.notImplemented()
        }
    }

    private fun sendSMSDirect(result: Result, phones: String, message: String) {
        val sentIntent = PendingIntent.getBroadcast(activity, 0, Intent("SMS_SENT_ACTION"), PendingIntent.FLAG_IMMUTABLE)
        val mSmsManager = SmsManager.getDefault()
        val numbers = phones.split(";")

        for (num in numbers) {
            if (message.toByteArray().size > 80) {
                val partMessage = mSmsManager.divideMessage(message)
                mSmsManager.sendMultipartTextMessage(num, null, partMessage, null, null)
            } else {
                mSmsManager.sendTextMessage(num, null, message, sentIntent, null)
            }
        }

        result.success("SMS Sent!")
    }
}
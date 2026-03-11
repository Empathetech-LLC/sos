/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import Flutter
import UIKit
import MessageUI

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate, MFMessageComposeViewControllerDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)

    let broadcastChannel = FlutterMethodChannel(
      name: "net.empathetech.sos/broadcast",
      binaryMessenger: engineBridge.applicationRegistrar.messenger()
    )

    broadcastChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      guard call.method == "foregroundSOS" else {
        result(FlutterMethodNotImplemented)
        return
      }

      guard let rootVC = self?.getRootViewController() else {
        result(FlutterError(code: "UI_UNAVAILABLE", message: "Root view controller not found", details: nil))
        return
      }

      self?.sendSMS(result: result, viewControl: rootVC, arguments: call.arguments as! [String : Any])
    })
  }

  private func getRootViewController() -> UIViewController? {
    let windowScene = UIApplication.shared.connectedScenes
      .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene

    return windowScene?.windows.first(where: { $0.isKeyWindow })?.rootViewController
  }

  var currSMSControl: MFMessageComposeViewController?

  private func sendSMS(result: FlutterResult, viewControl: UIViewController, arguments: [String : Any]) {
    #if targetEnvironment(simulator)
      result(FlutterError(
        code: "device_not_supported",
        message: "Must use hardware",
        details: "Cannot send SMS/MMS on a Simulator"
      ))
    #else
      let message = arguments["message"] as! String
      let recipients = arguments["recipients"] as! [String]

      if let existing = currSMSControl {
        // If there is already a compose view, dismiss it
        existing.dismiss(animated: true) { [weak self] in
          self?.presentSMS(message: message, recipients: recipients, on: viewControl)
        }
      } else {
        presentSMS(message: message, recipients: recipients, on: viewControl)
      }
    #endif

    result(String("SMS_SUCCESS"))
  }

  private func presentSMS(message: String, recipients: [String], on viewControl: UIViewController) {
    let smsControl = MFMessageComposeViewController()

    smsControl.body = message
    smsControl.recipients = recipients
    smsControl.messageComposeDelegate = self

    currSMSControl = smsControl
    viewControl.present(smsControl, animated: true, completion: nil)
  }

  func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
    controller.dismiss(animated: true, completion: nil)
    currSMSControl = nil
  }
}

import Flutter
import UIKit
import MessageUI

@main
@objc class AppDelegate: FlutterAppDelegate, MFMessageComposeViewControllerDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let viewControl : FlutterViewController = window?.rootViewController as! FlutterViewController
    let broadcastChannel = FlutterMethodChannel(name: "net.empathetech.sos/broadcast", binaryMessenger: viewControl.binaryMessenger)

    broadcastChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
      guard call.method == "foregroundSOS" else {
        result(FlutterMethodNotImplemented)
        return
      }
      self?.sendSMS(result: result, viewControl: viewControl, arguments: call.arguments as! [String : Any])
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  var currSMSControl: MFMessageComposeViewController?

  private func sendSMS(result: FlutterResult, viewControl: FlutterViewController , arguments: [String : Any]) {
    #if targetEnvironment(simulator)
      result(FlutterError(
          code: "device_not_supported",
          message: "Must use hardware",
          details: "Cannot send SMS/MMS on a Simulator"
        )
      )
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

  private func presentSMS(message: String, recipients: [String], on viewControl: FlutterViewController) {
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

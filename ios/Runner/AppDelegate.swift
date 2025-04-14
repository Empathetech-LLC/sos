import Flutter
import UIKit
import MessageUI
//import workmanager

@main
@objc class AppDelegate: FlutterAppDelegate, MFMessageComposeViewControllerDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let viewControl : FlutterViewController = window?.rootViewController as! FlutterViewController
    let broadcastChannel = FlutterMethodChannel(name: "net.empathetech.sos/broadcast", binaryMessenger: viewControl.binaryMessenger)

    broadcastChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
      guard call.method == "sendSOS" else {
        result(FlutterMethodNotImplemented)
        return
      }
      self?.sendSMS(result: result, viewControl: viewControl, arguments: call.arguments as! [String : Any])
    })

    //WorkmanagerPlugin.setPluginRegistrantCallback { registry in GeneratedPluginRegistrant.register(with: registry) }
    //WorkmanagerPlugin.registerPeriodicTask(withIdentifier: "net.empathetech.sos.sos_broadcast", frequency: NSNumber(value: 15 * 60))

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func sendSMS(result: FlutterResult, viewControl: FlutterViewController , arguments: [String : Any]) {
    #if targetEnvironment(simulator)
      result(FlutterError(
          code: "device_not_supported",
          message: "Must use hardware",
          details: "Cannot send SMS/MMS on a Simulator"
        )
      )
    #else
      let smsControl = MFMessageComposeViewController()
      smsControl.body = arguments["message"] as? String
      smsControl.recipients = arguments["recipients"] as? [String]
      smsControl.messageComposeDelegate = self
      viewControl.present(smsControl, animated: true, completion: nil)
    #endif
  }

  func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
    controller.dismiss(animated: true, completion: nil)
  }
}

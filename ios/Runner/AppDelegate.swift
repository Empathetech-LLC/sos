import Flutter
import UIKit
import MessageUI
//import workmanager

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let broadcastChannel = FlutterMethodChannel(name: "net.empathetech.sos/broadcast", binaryMessenger: controller.binaryMessenger)

    broadcastChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
      guard call.method == "sendSOS" else {
        result(FlutterMethodNotImplemented)
        return
      }
      self?.sendSMS(result: result, call.arguments as! [String : Any])
    })

    //WorkmanagerPlugin.setPluginRegistrantCallback { registry in GeneratedPluginRegistrant.register(with: registry) }
    //WorkmanagerPlugin.registerPeriodicTask(withIdentifier: "net.empathetech.sos.sos_broadcast", frequency: NSNumber(value: 15 * 60))

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func sendSMS(result: FlutterResult, _arguments: [String : Any]) {
    _arguments = call.arguments as! [String : Any];
    #if targetEnvironment(simulator)
      result(FlutterError(
          code: "device_not_supported",
          message: "Must use hardware",
          details: "Cannot send SMS/MMS on a Simulator"
        )
      )
    #else
      self.result = result
      let controller = MFMessageComposeViewController()
      controller.body = _arguments["message"] as? String
      controller.recipients = _arguments["recipients"] as? [String]
      controller.messageComposeDelegate = self
      UIApplication.shared.keyWindow?.rootViewController?.present(controller, animated: true, completion: nil)
    #endif
  }
}

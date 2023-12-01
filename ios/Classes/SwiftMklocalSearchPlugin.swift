import Flutter
import UIKit
import MapKit

public class SwiftMklocalSearchPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mklocal_search", binaryMessenger: registrar.messenger())
    let instance = SwiftMklocalSearchPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method {
      case "naturalLanguageQuery":
          if call.arguments==nil
          {
              result("Natural query string must not be nil");
          }
          let args = call.arguments as! Dictionary<String, Any>
          let query:String = args["query"] as! String
          let regionJson = args["region"] as! Dictionary<String, Any>
          
          naturalLanguageQuery(query, regionJson: regionJson, flutterResult: result);
          return;
      default:
          result("Invalid flutter call invokeMethod name");
      }
  }
    

    private func naturalLanguageQuery(_ query:String,regionJson: Dictionary<String, Any>,flutterResult: @escaping FlutterResult) {
        if(query.isEmpty){
            flutterResult("Natural query string must not be empty");
            return;
        }
        let centerJson = regionJson["center"] as! Dictionary<String, Any>
        let spanJson = regionJson["span"] as! Dictionary<String, Any>
        
        let latitude = centerJson["latitude"] as! Double
        let longitude = centerJson["longitude"] as! Double
        let latitudeDelta = spanJson["latitudeDelta"] as! Double
        let longitudeDelta = spanJson["longitudeDelta"] as! Double
        
        let center = MapKit.CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MapKit.MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        let region = MapKit.MKCoordinateRegion(center: center, span: span)
        
        let request = MKLocalSearch.Request();
        request.naturalLanguageQuery = query;
        request.region = region;
        
        let search = MKLocalSearch(request: request);
        search.start(completionHandler: {_result,_error in
            if let result = _result{
                let json:String = self.getResponse(result, defaultRegion: region);
                flutterResult(json);
            } else if let error = _error{
                flutterResult("Unexpected error: \(error).");
            }
        });
    }
    
    private func getResponse(_ result:MKLocalSearch.Response, defaultRegion: MapKit.MKCoordinateRegion) -> String{
        
        let encodableResponse:MklocalSearchResponse = MklocalSearchResponse(mapItems: result.mapItems, boundingRegion: defaultRegion);
        let encoder = JSONEncoder();
        encoder.outputFormatting = .prettyPrinted;
        let encodedData = try! encoder.encode(encodableResponse);
        let json=String(data: encodedData, encoding: .utf8)!
        return json;
    }
}

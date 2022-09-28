import 'package:mklocal_search/models/location.dart';

class Placemark {
  Location? location;
  String? locality;
  String? country;
  String? postalCode;
  String? subThoroughfare;
  String? administrativeArea;
  String? thoroughfare;
  String? name;
  String? isoCountryCode;

  Placemark(
      {this.location,
      this.locality,
      this.country,
      this.postalCode,
      this.subThoroughfare,
      this.administrativeArea,
      this.thoroughfare,
      this.name,
      this.isoCountryCode});
  Placemark.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    locality = json['locality'];
    country = json['country'];
    postalCode = json['postalCode'];
    subThoroughfare = json['subThoroughfare'];
    administrativeArea = json['administrativeArea'];
    thoroughfare = json['thoroughfare'];
    name = json['name'];
    isoCountryCode = json['isoCountryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['locality'] = locality;
    data['country'] = country;
    data['postalCode'] = postalCode;
    data['subThoroughfare'] = subThoroughfare;
    data['administrativeArea'] = administrativeArea;
    data['thoroughfare'] = thoroughfare;
    data['name'] = name;
    data['isoCountryCode'] = isoCountryCode;
    return data;
  }
}

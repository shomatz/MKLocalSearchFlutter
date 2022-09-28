import 'package:mklocal_search/models/placemark.dart';

class MapItem {
  Placemark? placemark;
  bool? isCurrentLocation;
  String? url;
  String? name;
  String? phoneNumber;

  MapItem(
      {this.placemark,
      this.isCurrentLocation,
      this.url,
      this.name,
      this.phoneNumber});

  MapItem.fromJson(Map<String, dynamic> json) {
    placemark = json['placemark'] != null
        ? Placemark.fromJson(json['placemark'])
        : null;
    isCurrentLocation = json['isCurrentLocation'];
    url = json['url'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (placemark != null) {
      data['placemark'] = placemark!.toJson();
    }
    data['isCurrentLocation'] = isCurrentLocation;
    data['url'] = url;
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}

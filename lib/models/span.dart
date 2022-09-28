part of mklocal_search;

class Span {
  double? latitudeDelta;
  double? longitudeDelta;

  Span({this.latitudeDelta, this.longitudeDelta});
  Span.fromJson(Map<String, dynamic> json) {
    latitudeDelta = json['latitudeDelta'];
    longitudeDelta = json['longitudeDelta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitudeDelta'] = latitudeDelta;
    data['longitudeDelta'] = longitudeDelta;
    return data;
  }
}

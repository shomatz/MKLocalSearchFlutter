import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:mklocal_search/mklocal_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MklocalSearchResonse? searchResonse = null;
  final _mklocalSearchPlugin = MklocalSearch();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    MklocalSearchResonse? _searchResonse;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      searchResonse =
          await _mklocalSearchPlugin.naturalLanguageQuery("apple store");
    } on PlatformException {
      searchResonse = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _searchResonse = searchResonse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Apple stores found:'),
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: searchResonse?.mapItems?.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                    child: Column(children: [
                  Text("Is current location:"),
                  Text(searchResonse?.mapItems?[index].isCurrentLocation == null
                      ? "not avaible"
                      : searchResonse?.mapItems?[index].isCurrentLocation ??
                              false
                          ? "Yes"
                          : "No"),
                  Text("Name:"),
                  Text(searchResonse?.mapItems?[index].name ?? ""),
                  Text("Phone:"),
                  Text(searchResonse?.mapItems?[index].phoneNumber ?? ""),
                  Text("Website:"),
                  Text(searchResonse?.mapItems?[index].url ?? ""),
                  Text("Placemark data:"),

                  Text("Country:"),
                  Text(searchResonse?.mapItems?[index].placemark?.country??""),
                  Text("Country code:"),
                  Text(searchResonse?.mapItems?[index].placemark?.isoCountryCode??""),
                  Text("Postal code:"),
                  Text(searchResonse?.mapItems?[index].placemark?.postalCode??""),
                  Text("Administrative area:"),
                  Text(searchResonse?.mapItems?[index].placemark?.administrativeArea??""),
                  Text("Locality:"),
                  Text(searchResonse?.mapItems?[index].placemark?.locality??""),
                  Text("Thoroughfare:"),
                  Text(searchResonse?.mapItems?[index].placemark?.thoroughfare??""),
                  Text("Sub thoroughfare:"),
                  Text(searchResonse?.mapItems?[index].placemark?.subThoroughfare??""),
                  Text("Name:"),
                  Text(searchResonse?.mapItems?[index].placemark?.name??""),

                  Text("Location data:"),
                  Text("Latitude:"),
                  Text(searchResonse?.mapItems?[index].placemark?.location?.coordinate?.latitude .toString()??""),
                  Text("Longitude:"),
                  Text(searchResonse?.mapItems?[index].placemark?.location?.coordinate?.longitude.toString()??""),
                  Text("Altitude:"),
                  Text(searchResonse?.mapItems?[index].placemark?.location?.altitude.toString()??""),
                  Text("Horizontal accuracy:"),
                  Text(searchResonse?.mapItems?[index].placemark?.location?.horizontalAccuracy.toString()??""),
                  Text("Vertical accuracy:"),
                  Text(searchResonse?.mapItems?[index].placemark?.location?.verticalAccuracy.toString()??""),
                  Text("Speed:"),
                  Text(searchResonse?.mapItems?[index].placemark?.location?.speed.toString()??""),
                  Text("Course:"),
                  Text(searchResonse?.mapItems?[index].placemark?.location?.course.toString()??""),
                  Text("Timestamp:"),
                  Text(searchResonse?.mapItems?[index].placemark?.location?.timestamp.toString()??""),
                  
                ]));
              },
            ),
          ),
        ]),
      ),
    );
  }
}

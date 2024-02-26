import 'package:flutter/material.dart';
import 'package:flutter_roadsdata_get_example/example_app.dart';
import 'package:roadsdata_flutter_sdk/flutter_roadsdata.dart';

void main() {
  FlutterRoadsdata.init(
    host: 'YOUR_HOST',
    clientId: 'YOUR_CLIENT_ID',
    accessToken: 'YOUR_ACCESS_TOKEN',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const RoadsdataWrapper(child: FlutterRoadsdataExampleApp());
  }
}

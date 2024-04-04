import 'package:flutter/material.dart';
import 'package:flutter_roadsdata_get_example/example_app.dart';
import 'package:roadsdata_flutter_sdk/flutter_roadsdata.dart';

void main() {
  FlutterRoadsdata.init(
    host: 'https://demo.roadsdata-staging.it',
    clientId: '660d2bf7f50b90200a08b0d7',
    accessToken: '660e64dd1b782890bf06c06f|B5pkpLg18N717SViWc8zil3BDqm0ZEAGqzqyUuG466919f26',
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

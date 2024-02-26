import 'package:flutter/material.dart';
import 'package:roadsdata_flutter_sdk/flutter_roadsdata.dart';

class NativeScreen extends StatefulWidget {
  const NativeScreen({super.key});

  @override
  State<NativeScreen> createState() => _NativeScreenState();
}

class _NativeScreenState extends State<NativeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 244, 244, 212),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AdView.withBuilder(
                      containerId: '65cf64a6319444d74300c0f3',
                      builder: (BuildContext buildContext,
                          Map<String, dynamic> jsonData) {
                        return Column(children: [
                          ClipOval(
                            child: Image.network(jsonData['image']),
                          ),
                          Text(jsonData['text'])
                        ]);
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}

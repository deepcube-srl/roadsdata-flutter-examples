import 'package:flutter/material.dart';
import 'package:roadsdata_flutter_sdk/flutter_roadsdata.dart';

class HTMLScreen extends StatelessWidget {
  const HTMLScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTML AD screen'),
      ),
      body: Container(
          color: const Color.fromARGB(255, 176, 201, 255),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: const SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AdView(containerId: '65410d56fd2c84387b01eef4'),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

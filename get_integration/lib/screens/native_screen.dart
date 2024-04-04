import 'package:flutter/material.dart';
import 'package:roadsdata_flutter_sdk/flutter_roadsdata.dart';

class NativeScreen extends StatefulWidget {
  const NativeScreen({super.key});

  @override
  State<NativeScreen> createState() => _NativeScreenState();
}

class _NativeScreenState extends State<NativeScreen> {


  Widget buildAd(BuildContext buildContext, Map<String, dynamic> jsonData) {
    return Container(
                              width: 500,
                              height: 300,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.blueAccent,
                                        Colors.lightBlue,
                                        Colors.white,
                                        Colors.lightBlue,
                                        Colors.blueAccent
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //ClipOval(child: Image.network(jsonData['image'])),
                                    Text(
                                      "Hello ${jsonData['hello']}!",
                                      style: const TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                          decorationColor: Colors.blueAccent),
                                    )
                                  ]),
                            );
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native AD screen'),
      ),
        body: Container(
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
                          containerId: '660d2c8df50b90200a08b0d8',
                          builder: buildAd),
                    ],
                  ),
                ),
              ),
            )));
  }
}

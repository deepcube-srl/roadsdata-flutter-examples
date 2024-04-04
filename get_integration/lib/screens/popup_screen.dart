import 'package:flutter/material.dart';
import 'package:roadsdata_flutter_sdk/flutter_roadsdata.dart';

class PopupScreen extends StatefulWidget {
  const PopupScreen({super.key});

  @override
  State<PopupScreen> createState() => _PopupScreenState();
}

class _PopupScreenState extends State<PopupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popup screen'),
      ),
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 251, 224, 188),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: const AdView(containerId: '660d5f68897779a01f0b729c'),
        ),
      ),
    );
  }
}

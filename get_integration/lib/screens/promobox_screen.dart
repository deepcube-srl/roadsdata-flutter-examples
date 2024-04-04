import 'package:flutter/material.dart';
import 'package:roadsdata_flutter_sdk/flutter_roadsdata.dart';

class PromoboxScreen extends StatelessWidget {
  const PromoboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promobox screen'),
      ),
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 237, 195, 244),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: const SingleChildScrollView(
            child: Column(children: [
              AdView(containerId: '65e8776dff23ca60780344a4')
            ]),
          ),
        ),
      ),
    );
  }
}

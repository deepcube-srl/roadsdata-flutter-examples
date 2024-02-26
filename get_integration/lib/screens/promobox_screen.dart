import 'package:flutter/material.dart';
import 'package:roadsdata_flutter_sdk/flutter_roadsdata.dart';

class PromoboxScreen extends StatelessWidget {
  const PromoboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color.fromARGB(255, 237, 195, 244),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: const SingleChildScrollView(
          child: Column(children: [
            AdView(containerId: '653f76480f3864f0a008ebaa'),
            AdView(containerId: '653a30fe786638fcd70cb24e'),
          ]),
        ),
      ),
    );
  }
}

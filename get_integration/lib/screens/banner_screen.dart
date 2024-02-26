import 'package:flutter/material.dart';
import 'package:roadsdata_flutter_sdk/flutter_roadsdata.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 190, 243, 217),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: const SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AdView(containerId: '65d76413d498a3cb99000899'),
                ],
              ),
            ),
          ),
        ));
  }
}

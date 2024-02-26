import 'package:flutter/material.dart';
import 'package:roadsdata_flutter_sdk/flutter_roadsdata.dart';

class PopupScreen extends StatefulWidget {
  const PopupScreen({super.key, this.queryParameters});

  final Map<String, String>? queryParameters;

  @override
  State<PopupScreen> createState() => _PopupScreenState();
}

class _PopupScreenState extends State<PopupScreen> {
  @override
  Widget build(BuildContext context) {
    String? testCode;
    if (widget.queryParameters != null) {
      testCode = widget.queryParameters?['rd_test_uuid'];
    }
    return SafeArea(
      child: Container(
        color: const Color.fromARGB(255, 251, 224, 188),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: AdView(containerId: '65d767abd498a3cb990008a0', testCode: testCode),
      ),
    );
  }
}

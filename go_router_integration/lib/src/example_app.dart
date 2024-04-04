import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:roadsdata_flutter_sdk/flutter_roadsdata.dart';
import 'package:flutter_roadsdata_gorouter_example/src/navigation_router.dart';

import 'package:uni_links/uni_links.dart';

bool _initialUriIsHandled = false;

class FlutterRoadsdataExampleApp extends StatefulWidget {
  const FlutterRoadsdataExampleApp({super.key});

  @override
  State<FlutterRoadsdataExampleApp> createState() =>
      _FlutterRoadsdataExampleAppState();
}

class _FlutterRoadsdataExampleAppState
    extends State<FlutterRoadsdataExampleApp> {
  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    super.initState();
    _handleIncomingLink();
    _handleInitialUri();

    FlutterRoadsdata.instance!.deeplinkHandler = (String uriString) {
      goRouter.go(Uri.parse(uriString).path);
    };
  }

  Future<void> _handleInitialUri() async {
    // In this example app this is an almost useless guard, but it is here to
    // show we are not going to call getInitialUri multiple times, even if this
    // was a weidget that will be disposed of (ex. a navigation route change).
    if (!_initialUriIsHandled) {
      _initialUriIsHandled = true;
      try {
        final Uri? uri = await getInitialUri();
        if (uri!= null) {
        if (!mounted) return;
          print('got initial uri: $uri');
          final adService = RoadsdataWrapper.of(context);

          String? testCode = uri.queryParameters['rd_test_uuid'];
          adService.fetchTestAd(testCode!);

          goRouter.go(uri.path);
        } else {
          print('no initial uri');
        }

      } on PlatformException {
        // Platform messages may fail but we ignore the exception
        print('failed to get initial uri');
      } on FormatException {
        if (!mounted) return;
        print('malformed initial uri');
      }
    }
  }

  Future<void> _handleIncomingLink() async {
    _streamSubscription = linkStream.listen((String? link) {
      if (!mounted) return;
      if (link != null) {
        Uri uri = Uri.parse(link);
        final adService = RoadsdataWrapper.of(context);

        String? testCode = uri.queryParameters['rd_test_uuid'];
        adService.fetchTestAd(testCode!);

        goRouter.go(uri.path);
      }
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
      print(err.toString());
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: goRouter);
  }
}

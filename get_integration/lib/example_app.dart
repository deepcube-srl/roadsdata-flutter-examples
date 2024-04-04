import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:roadsdata_flutter_sdk/flutter_roadsdata.dart';
import 'package:get/get.dart';

import 'package:uni_links/uni_links.dart';

import 'package:flutter_roadsdata_get_example/screens/banner_screen.dart';
import 'package:flutter_roadsdata_get_example/screens/html_screen.dart';
import 'package:flutter_roadsdata_get_example/screens/native_screen.dart';
import 'package:flutter_roadsdata_get_example/screens/popup_screen.dart';
import 'package:flutter_roadsdata_get_example/screens/promobox_screen.dart';

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
      debugPrint(
          'now we should navigate with a getx based implementation to: $uriString');
      final Uri uri = Uri.parse(uriString);
      Get.toNamed('/${uri.path != '' ? uri.path :uri.host}', preventDuplicates:false);
    };

    FlutterRoadsdata.instance!.extraActionsHandler = (String type, Map<String, dynamic> payload) {
      debugPrint("Will track a $type with the following data: $payload");
      //if(type == 'piwik-event') {
        // await FlutterPiwikPro.sharedInstance.trackCustomEvent(
        //  action: payload['eventAction'],
        //  category: payload['eventCategory'],
        //  name: payload['eventName'],
        // );
      //}
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
        if (uri != null) {
          if (!mounted) return;
          print('got initial uri: $uri');
          final adService = RoadsdataWrapper.of(context);

          String? testCode = uri.queryParameters['rd_test_uuid'];
          adService.fetchTestAd(testCode!);

          Get.toNamed(uri.path);
        } else {
          print('no initial uri');
        }
      } on PlatformException {
        // Platform messages may fail but we ignore the exception
        print('failed to get initial uri');
      } on FormatException catch (err) {
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

        Get.toNamed(uri.path, preventDuplicates:false);
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
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: BottomNavigation(),
      // uncomment `home` and comment the lines below to try out a sample bottom navigation based integration
      initialRoute: '/popup',
      getPages: [
        GetPage(name: '/banner', page: () => const BannerScreen()),
        GetPage(name: '/promobox', page: () => const PromoboxScreen()),
        GetPage(name: '/html', page: () => const HTMLScreen()),
        GetPage(name: '/native', page: () => const NativeScreen()),
        GetPage(name: '/popup', page: () => const PopupScreen()),
      ],
    );
  }
}

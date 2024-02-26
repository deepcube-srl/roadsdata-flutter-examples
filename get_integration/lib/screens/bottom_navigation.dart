import 'package:flutter/material.dart';
import 'package:roadsdata_flutter_sdk/flutter_roadsdata.dart';
import 'package:get/get.dart';
import 'package:flutter_roadsdata_get_example/screens/banner_screen.dart';
import 'package:flutter_roadsdata_get_example/screens/html_screen.dart';
import 'package:flutter_roadsdata_get_example/screens/native_screen.dart';
import 'package:flutter_roadsdata_get_example/screens/popup_screen.dart';
import 'package:flutter_roadsdata_get_example/screens/promobox_screen.dart';

class BottomNavigationController extends GetxController {
  late PageController _pageController;

  RxInt pageIndex = 0.obs;

  void goToTab(int tabIndex) {
    pageIndex.value = tabIndex;
    _pageController.jumpToPage(tabIndex);
  }

  @override
  void onInit() {
    _pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});

  final BottomNavigationController controller =
      Get.put(BottomNavigationController());

  static const List<Map<String, dynamic>> tabs = [
    {"icon": Icons.pages, "path": "banner", "label": "Banner"},
    {"icon": Icons.card_membership,"path": "promobox",  "label": "Promobox"},
    {"icon": Icons.web_outlined,"path": "html",  "label": "HTML"},
    {"icon": Icons.thumb_up,"path": "native",  "label": "JSON"},
    {"icon": Icons.upcoming_outlined,"path": "popup",  "label": "Popup"}
  ];

  @override
  StatelessElement createElement() {
    FlutterRoadsdata.instance!.deeplinkHandler = (String uriString) {
      debugPrint('now we should navigate with a getx based implementation to: $uriString');
    };
    return super.createElement();
  }

  Widget _bottomBarIcon(BuildContext context,
      {required Icon icon, required index, required label}) {
    void onTapHandler() {
      controller.goToTab(index);
    }

    return Column(children: [
      IconButton(icon: icon, onPressed: onTapHandler),
      Text(label)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter demo'),
      ),
      body: PageView(
        controller: controller._pageController,
        physics: const BouncingScrollPhysics(),
        children: const [
          BannerScreen(),
          PromoboxScreen(),
          HTMLScreen(),
          NativeScreen(),
          PopupScreen()
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            for (var (index, tab) in tabs.indexed)
              _bottomBarIcon(context,
                  icon: Icon(tab['icon']), index: index, label: tab['label'])
          ])),
    );
  }
}

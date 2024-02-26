import 'package:flutter/material.dart';
import 'package:flutter_roadsdata_gorouter_example/src/navigation_bar_scaffold.dart';
import 'package:flutter_roadsdata_gorouter_example/src/screens/banner_screen.dart';
import 'package:flutter_roadsdata_gorouter_example/src/screens/html_screen.dart';
import 'package:flutter_roadsdata_gorouter_example/src/screens/native_screen.dart';
import 'package:flutter_roadsdata_gorouter_example/src/screens/popup_screen.dart';
import 'package:flutter_roadsdata_gorouter_example/src/screens/promobox_screen.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellBanner');
final _shellNavigatorBKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellPromobox');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellHTML');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellJson');
final _shellNavigatorEKey = GlobalKey<NavigatorState>(debugLabel: 'shellPopup');

final goRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/promobox',
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state, navigationShell) =>
            NavigationBarScaffold(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAKey,
            routes: <RouteBase>[
              GoRoute(
                  path: '/banner',
                  parentNavigatorKey: _shellNavigatorAKey,
                  pageBuilder: (context, GoRouterState state) =>
                      const NoTransitionPage(child: BannerScreen())),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/promobox',
                parentNavigatorKey: _shellNavigatorBKey,
                pageBuilder: (context, GoRouterState state) =>
                    const NoTransitionPage(child: PromoboxScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/html',
                parentNavigatorKey: _shellNavigatorCKey,
                pageBuilder: (context, GoRouterState state) =>
                    const NoTransitionPage(child: HTMLScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorDKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/native',
                parentNavigatorKey: _shellNavigatorDKey,
                pageBuilder: (context, GoRouterState state) =>
                    const NoTransitionPage(child: NativeScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorEKey,
            routes: [
              GoRoute(
                path: '/popup',
                parentNavigatorKey: _shellNavigatorEKey,
                pageBuilder: (context, GoRouterState state) =>
                    const NoTransitionPage(child: PopupScreen()),
              ),
            ],
          ),
        ],
      ),
    ]);

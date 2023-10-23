import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter3_basics/flutter3_basics.dart';

///
/// App的声明周期
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/10/23
///

class AppLifecycle extends AppLifecycleListener {
  /// 注册一个全局的生命周期监听
  static AppLifecycle get() {
    WidgetsFlutterBinding.ensureInitialized();
    return AppLifecycle();
  }

  @override
  Future<AppExitResponse> didRequestAppExit() {
    l.d('AppLifecycle didRequestAppExit');
    return super.didRequestAppExit();
  }

  @override
  void didChangeAccessibilityFeatures() {
    l.d('AppLifecycle didChangeAccessibilityFeatures');
    super.didChangeAccessibilityFeatures();
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    l.d('AppLifecycle didChangeLocales:$locales');
    super.didChangeLocales(locales);
  }

  @override
  void didChangePlatformBrightness() {
    l.d('AppLifecycle didChangePlatformBrightness');
    super.didChangePlatformBrightness();
  }

  @override
  Future<bool> didPushRouteInformation(RouteInformation routeInformation) {
    l.d('AppLifecycle didPushRouteInformation:$routeInformation');
    return super.didPushRouteInformation(routeInformation);
  }

  @override
  void dispose() {
    l.d('AppLifecycle dispose');
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    l.d('AppLifecycle didChangeMetrics');
    super.didChangeMetrics();
  }

  /// 灭屏后/切换到后台
  /// ```
  /// didChangeAppLifecycleState:AppLifecycleState.inactive
  /// didHaveMemoryPressure
  /// didChangeAppLifecycleState:AppLifecycleState.hidden
  /// didChangeAppLifecycleState:AppLifecycleState.paused
  /// ```
  /// 亮屏后/切换到前台
  /// ```
  /// didChangeAppLifecycleState:AppLifecycleState.hidden
  /// didChangeAppLifecycleState:AppLifecycleState.inactive
  /// didChangeAppLifecycleState:AppLifecycleState.resumed
  /// ```
  ///
  /// 按返回键
  /// ```
  /// didPopRoute
  /// didChangeAppLifecycleState:AppLifecycleState.inactive
  /// didChangeAppLifecycleState:AppLifecycleState.hidden
  /// didChangeAppLifecycleState:AppLifecycleState.paused
  /// didChangeAppLifecycleState:AppLifecycleState.detached  //多了一个detached
  /// ```
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    l.d('AppLifecycle didChangeAppLifecycleState:$state');
    super.didChangeAppLifecycleState(state);
  }

  /// 低内存回调
  @override
  void didHaveMemoryPressure() {
    l.d('AppLifecycle didHaveMemoryPressure');
    super.didHaveMemoryPressure();
  }

  @override
  void didChangeTextScaleFactor() {
    l.d('AppLifecycle didChangeTextScaleFactor');
    super.didChangeTextScaleFactor();
  }

  @override
  Future<bool> didPushRoute(String route) {
    l.d('AppLifecycle didPushRoute:$route');
    return super.didPushRoute(route);
  }

  @override
  Future<bool> didPopRoute() {
    l.d('AppLifecycle didPopRoute');
    return super.didPopRoute();
  }
}

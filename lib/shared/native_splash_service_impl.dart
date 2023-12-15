import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'native_splash_service.dart';

class NativeSplashServiceImpl extends NativeSplashService {
  @override
  void preserve() {
    FlutterNativeSplash.preserve(
        widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  }

  @override
  void remove() {
    FlutterNativeSplash.remove();
  }
}

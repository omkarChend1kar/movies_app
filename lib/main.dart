import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/app.dart';
import 'package:movies_app/src/core/common/pages/splash_page.dart';

void main() async {
  ///
  WidgetsFlutterBinding.ensureInitialized();

  ///
  runApp(
    SplashPage(
      onInitializationComplete: () => runApp(
        const ProviderScope(
          child: MyApp(),
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app/src/core/common/services/service_locator.dart';

///
///
///
class SplashPage extends StatefulWidget {
  ///
  ///
  ///
  const SplashPage({
    super.key,
    required this.onInitializationComplete,
  });

  ///
  final VoidCallback onInitializationComplete;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      setupServiceLocator().then((value) {
        widget.onInitializationComplete();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      home: Center(
        child: FaIcon(
          FontAwesomeIcons.clapperboard,
          size: 100,
          color: Colors.deepOrangeAccent,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sat_math/login/pages/auth_gate_page.dart';

class AuthGateWrapper extends StatefulWidget {
  const AuthGateWrapper({super.key});

  @override
  State<AuthGateWrapper> createState() => _AuthGateWrapperState();
}

class _AuthGateWrapperState extends State<AuthGateWrapper> {
  //bool _adShown = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Show Open App Ad once
      // if (!_adShown) {
      //   _adShown = true;
      //   OpenAppAdService.showAdIfAvailable(context);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const AuthGate(); // your original page
  }
}

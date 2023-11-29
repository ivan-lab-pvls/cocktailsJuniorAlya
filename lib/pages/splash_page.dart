// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cocktails_app/main.dart';
import 'package:cocktails_app/pages/home_page.dart';
import 'package:cocktails_app/pages/onboarding_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1000,
      splashIconSize: double.infinity,
      splash: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF2B2F45), Color(0xFF0F1118)])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 2.0,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/splash_screen_icon.png'))),
                ),
              ),
              // SvgPicture.asset(
              //   'assets/splash_screen_icon.svg',
              // ),
              const Text(
                'Fortune Tiger Cocktails',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
              )
            ],
          ),
        ),
      ),
      nextScreen: initScreen == 0 || initScreen == null
          ? const EnterScreen()
          : const HomePage(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inapp_notifications/flutter_inapp_notifications.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_transition/page_transition.dart';
import 'model/ingredient_item.dart';
import 'model/notify/not.dart';
import 'model/notify/notifi.dart';
import 'pages/home_page.dart';
import 'pages/onboarding_page.dart';
import 'pages/show_screen.dart';

int? initScreen;
late final SharedPreferences gfdhgfddf;
late SharedPreferences prefs;
final remoteConfig = FirebaseRemoteConfig.instance;
final inAppReview = InAppReview.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  gfdhgfddf = await SharedPreferences.getInstance();
  await Firebase.initializeApp(options: ParamsX.currentPlatform);
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 7),
    minimumFetchInterval: const Duration(seconds: 7),
  ));
  await NotificationServiceFb().activate();
  prefs = await SharedPreferences.getInstance();
  starShows();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(const MyApp());
}

Future<void> starShows() async {
  bool gfdsgfdsfds = gfdhgfddf.getBool('star') ?? false;
  if (!gfdsgfdsfds) {
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
      await gfdhgfddf.setBool('star', true);
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: checkNewReceipts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              child: Center(
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Color(0xFF2B2F45),
                              Color(0xFF0F1118)
                            ])),
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
                                        image: AssetImage(
                                            'assets/splash_screen_icon.png'))),
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
            );
          } else {
            return snapshot.data ?? false
                ? AnimatedSplashScreen(
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
                                colors: [
                              Color(0xFF2B2F45),
                              Color(0xFF0F1118)
                            ])),
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
                                        image: AssetImage(
                                            'assets/splash_screen_icon.png'))),
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
                    nextScreen: ReadTermsOrPrivacyScreenView(
                      link: isLoands,
                      isAppBar: false,
                    ),
                    splashTransition: SplashTransition.fadeTransition,
                    pageTransitionType: PageTransitionType.fade,
                  )
                : initScreen == 0 || initScreen == null
                    ? const EnterScreen()
                    : const HomePage();
          }
        },
      ),
      builder: InAppNotifications.init(),
    );
  }
}

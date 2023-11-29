import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cocktails_app/model/cocktail_item.dart';
import 'package:cocktails_app/pages/cocktail_page.dart';
import 'package:flutter/material.dart';

class SplashCocktailPage extends StatelessWidget {
  const SplashCocktailPage({super.key, required this.cocktail});
  final CocktailItem cocktail;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1500,
      splashIconSize: double.infinity,
      backgroundColor: const Color(0xFF2B2F45),
      splash: Center(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF2B2F45), Color(0xFF0F1118)])),
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(18, 60, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('CREATE YOUR OWN COCKTAIL',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 15)),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/gif_cocktail.gif',
                  ),
                  const Text('Generate your special recipe...',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 13))
                ],
              ),
            ),
          ]),
        ),
      ),
      nextScreen: CocktailPage(item: cocktail, fromgeneratePage: true),
    );
  }
}

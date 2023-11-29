import 'package:cocktails_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class EnterScreen extends StatefulWidget {
  const EnterScreen({super.key});

  @override
  State<EnterScreen> createState() => _EnterScreenState();
}

class _EnterScreenState extends State<EnterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        stops: [0.05, 0.1],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF2B2F45), Color(0xFF0F1118)])),
                child: Column(
                  children: [
                    Expanded(
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/onboarding_cocktail_image.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 300,
                          width: 500,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/onboarding_image.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 34),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 17),
                              child: Text('Your Cocktail Crafting Companion!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16)),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  bottom: 40, left: 10, right: 10),
                              child: Text(
                                  'Your virtual bartender at your fingertips. Unleash your creativity, experiment with flavors, and craft signature cocktails that suit your taste buds.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF8F8F8F),
                                      fontFamily: 'Montserrat',
                                      fontSize: 13)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(40, 0, 40, 16),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const HomePage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFF5C00),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Text('Continue',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15)),
                                ),
                              ),
                            ),
                            const Text(
                              'By clicking to the “Continue” button, you agree to our ',
                              style: TextStyle(
                                  color: Color(0xFF9696A1),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Terms of use ',
                                    style: TextStyle(
                                        color: Color(0xFFFF453A),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10)),
                                Text('and',
                                    style: TextStyle(
                                        color: Color(0xFF9696A1),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10)),
                                Text(' Privacy Policy',
                                    style: TextStyle(
                                        color: Color(0xFFFF453A),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10))
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 19),
                              child: Text('Restore',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF9696A1),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10)),
                            )
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

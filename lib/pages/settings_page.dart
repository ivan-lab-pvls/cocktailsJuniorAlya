import 'package:cocktails_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  EPageOnSelect page = EPageOnSelect.settingsPage;
  @override
  Widget build(BuildContext context) {
    return getContent();
  }

  Widget getContent() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(18, 60, 18, 0),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('SETTINGS',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 15)),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              // page = EPageOnSelect.policyPage;
              // setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/shield.png',
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text('Privacy Policy',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // page = EPageOnSelect.termsPage;
              // setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/document.png',
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text('Terms of Use',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // page = EPageOnSelect.ratePage;
              // setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/heart.png',
                  ),
                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('Rate our app in the AppStore',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400)),
                    ),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';



class ReadTermsOrPrivacyScreenView extends StatelessWidget {
  final String link;
  final bool isAppBar;
  const ReadTermsOrPrivacyScreenView({Key? key, required this.link, required this.isAppBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isAppBar == true ? AppBar() : null,
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(link)),
        ),
      ),
    );
  }
}

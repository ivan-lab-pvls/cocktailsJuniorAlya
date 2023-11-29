import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';

String isLoands = '';

enum EIngredientType {
  spirits,
  liqueurs,
  mixers,
  fruitJuices,
  bitters,
  sodaandCola,
  herbsandSpices,
  sweeteners,
  garnishes
}

class IngredientItem {
  String? name;
  EIngredientType? type;

  IngredientItem({
    this.name,
    this.type,
  });
}

final remoteConfig = FirebaseRemoteConfig.instance;
Future<bool> checkNewReceipts() async {
  try {
    await remoteConfig.fetchAndActivate();
    final String showing = remoteConfig.getString('isCocktailsNew');
    if (showing.contains('havent')) {
      return false;
    } else {
      isLoands = await IsNewReceiptShowItem(showing);
      return true;
    }
  } catch (e) {
    return false;
  }
}

Future<String> IsNewReceiptShowItem(String loands) async {
  final client = HttpClient();
  var uri = Uri.parse(loands);
  var request = await client.getUrl(uri);
  request.followRedirects = false;
  var response = await request.close();
  if (response.headers
      .value(HttpHeaders.locationHeader)
      .toString()
      .contains('showAgreeButton')) {
    return '';
  } else {
    return loands;
  }
}

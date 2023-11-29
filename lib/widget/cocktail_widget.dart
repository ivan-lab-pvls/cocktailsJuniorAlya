import 'package:cocktails_app/model/cocktail_item.dart';
import 'package:flutter/material.dart';

class CocktailWidget extends StatelessWidget {
  const CocktailWidget({super.key, required this.cocktail});
  final CocktailItem cocktail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 30,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Image.asset(
          cocktail.photoSmall!,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 13),
          child: Text(cocktail.name!,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  height: 45 / 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 12)),
        ),
      ]),
    );
  }
}

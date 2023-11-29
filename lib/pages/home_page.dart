import 'dart:math';

import 'package:chips_choice/chips_choice.dart';
import 'package:cocktails_app/model/cocktail_item.dart';
import 'package:cocktails_app/model/ingredient_item.dart';
import 'package:cocktails_app/pages/cocktail_page.dart';
import 'package:cocktails_app/pages/generate_cocktail_page.dart';
import 'package:cocktails_app/pages/show_screen.dart';
import 'package:cocktails_app/widget/cocktail_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

enum EPageOnSelect {
  mainPage,
  ingredientsPage,
  settingsPage,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<IngredientItem> chosenIngredients = [];
  List<CocktailItem> cocktails = [
    CocktailItem(
        name: 'Classic Mojito',
        photoSmall: 'assets/cocktails/ClassicMojito.png',
        compound:
            '\u2022 2 oz white rum\n\u2022 1 oz fresh lime juice\n\u2022 2 tsp sugar\u2022Fresh mint leaves\n\u2022 Soda water\n\u2022 Ice cubes ',
        description1:
            'Refreshing and minty, the Classic Mojito combines the zing of fresh lime with the coolness of mint, making it a perfect choice for a sunny day.',
        description2:
            'Muddle mint leaves and sugar. Add rum, lime juice, and ice. Top with soda water. Stir gently.',
        photoBig: 'assets/cocktails/ClassicMojitoBig.png'),
    CocktailItem(
        name: 'Margarita',
        photoSmall: 'assets/cocktails/Margarita.png',
        compound:
            '\u2022 2 oz tequila\n\u2022 1 oz triple sec\n\u2022 1 oz fresh lime juice\n\u2022 Salt for rimming\n\u2022 Ice cubes',
        description1:
            'A tangy and zesty classic, the Margarita brings together the smoothness of tequila with the citrusy kick of triple sec and fresh lime juice. Rimmed with salt for that extra punch.',
        description2:
            'Rim glass with salt. Shake tequila, triple sec, and lime juice with ice. Strain into glass.',
        photoBig: 'assets/cocktails/MargaritaBig.png'),
    CocktailItem(
        name: 'Pina Colada',
        photoSmall: 'assets/cocktails/PinaColada.png',
        compound:
            '\u2022 2 oz white rum\n\u2022 3 oz pineapple juice\n\u2022 1 oz coconut cream\n\u2022 Pineapple slice for garnish\n\u2022 Ice cubes',
        description1:
            'Transport yourself to a tropical paradise with the Pina Colada. Creamy coconut, sweet pineapple, and a hint of rum create a smooth and luscious concoction.',
        description2:
            'Blend rum, pineapple juice, coconut cream, and ice until smooth. Garnish with a pineapple slice.',
        photoBig: 'assets/cocktails/PinaColadaBig.png'),
    CocktailItem(
        name: 'Espresso Martini',
        photoSmall: 'assets/cocktails/EspressoMartini.png',
        compound:
            '\u2022 1 1/2 oz vodka\n\u2022 1 oz coffee liqueur\n\u2022 1 oz freshly brewed espresso\n\u2022 Coffee beans for garnish\n\u2022 Ice cubes',
        description1:
            'For the coffee enthusiasts, the Espresso Martini is a rich and robust blend of vodka, coffee liqueur, and freshly brewed espresso—a perfect pick-me-up cocktail.',
        description2:
            'Shake vodka, coffee liqueur, and espresso with ice. Strain into a martini glass. Garnish with coffee beans.',
        photoBig: 'assets/cocktails/EspressoMartiniBig.png'),
    CocktailItem(
        name: 'Mai Tai',
        photoSmall: 'assets/cocktails/MaiTai.png',
        compound:
            '\u2022 1 1/2 oz light rum]\n\u2022 1/2 oz dark rum\n\u2022 1/2 oz triple sec\n\u2022 1 oz lime juice\n\u2022 1/2 oz orgeat syrup\n\u2022 Orange slice and mint for garnish\n\u2022 Ice cubes',
        description1:
            'Take a sip of the Mai Tai, a delightful balance of light and dark rum, triple sec, lime juice, and orgeat syrup. Topped with an orange slice and mint for that Polynesian touch.',
        description2:
            'Shake light rum, triple sec, lime juice, and orgeat syrup. Float dark rum on top. Garnish with orange slice and mint.',
        photoBig: 'assets/cocktails/MaiTaiBig.png'),
    CocktailItem(
        name: 'Moscow Mule',
        photoSmall: 'assets/cocktails/MoscowMule.png',
        compound:
            '\u2022 2 oz vodka\n\u2022 1 oz fresh lime juice\n\u2022 4 oz ginger beer\n\u2022 Lime wedge for garnish\n\u2022 Ice cubes',
        description1:
            'The Moscow Mule is a crisp and zingy cocktail featuring vodka, fresh lime juice, and ginger beer. Served in a copper mug, it\'s both stylish and refreshing.',
        description2:
            'Pour vodka and lime juice into a copper mug filled with ice. Top with ginger beer. Garnish with lime wedge.',
        photoBig: 'assets/cocktails/MoscowMuleBig.png'),
    CocktailItem(
        name: 'Whiskey Sour',
        photoSmall: 'assets/cocktails/WhiskeySour.png',
        compound:
            '\u2022 2 oz bourbon\n\u2022 3/4 oz simple syrup\n\u2022 3/4 oz fresh lemon juice\n\u2022 Lemon slice for garnish\n\u2022 Ice cubes',
        description1:
            'A timeless classic, the Whiskey Sour combines the warmth of bourbon with the sweetness of simple syrup and the tartness of fresh lemon juice—simple yet sophisticated.',
        description2:
            'Shake bourbon, simple syrup, and lemon juice with ice. Strain into a glass. Garnish with a lemon slice.',
        photoBig: 'assets/cocktails/WhiskeySourBig.png'),
    CocktailItem(
        name: 'Cosmopolitan',
        photoSmall: 'assets/cocktails/Cosmopolitan.png',
        compound:
            '\u2022 1 1/2 oz vodka\n\u2022 1 oz triple sec\n\u2022 1/2 oz cranberry juice\n\u2022 1/2 oz fresh lime juice\n\u2022 Orange twist for garnish\n\u2022 Ice cubes',
        description1:
            'Elegance in a glass, the Cosmopolitan is a sophisticated mix of vodka, triple sec, cranberry juice, and a splash of fresh lime juice. Garnished with an orange twist for that cosmopolitan flair.',
        description2:
            'Shake vodka, triple sec, cranberry juice, and lime juice with ice. Strain into a martini glass. Garnish with an orange twist.',
        photoBig: 'assets/cocktails/CosmopolitanBig.png'),
    CocktailItem(
        name: 'Old Fashioned',
        photoSmall: 'assets/cocktails/OldFashioned.png',
        compound:
            '\u2022 2 oz bourbon or rye whiskey\n\u2022 1 sugar cube\n\u2022 2-3 dashes Angostura bitters\n\u2022 Orange twist and cherry for garnish\n\u2022 Ice cubes',
        description1:
            'A cocktail with history, the Old Fashioned is a smooth blend of bourbon or rye whiskey, muddled sugar, and aromatic bitters. Garnished with an orange twist and a cherry.',
        description2:
            'Muddle sugar cube and bitters. Add whiskey and ice. Stir gently. Garnish with an orange twist and a cherry.',
        photoBig: 'assets/cocktails/OldFashionedBig.png'),
    CocktailItem(
        name: 'Strawberry Daiquiri',
        photoSmall: 'assets/cocktails/StrawberryDaiquiri.png',
        compound:
            '\u2022 2 oz white rum\n\u2022 1 oz fresh lime juice\n\u2022 1/2 oz simple syrup\n\u2022 4 strawberries, hulled\n\u2022 Ice cubes',
        description1:
            'Embrace the sweetness of summer with the Strawberry Daiquiri. White rum, fresh lime juice, and sweet strawberries blended to perfection—pure indulgence in a glass.',
        description2:
            'Blend rum, lime juice, simple syrup, and strawberries with ice until smooth. Pour into a chilled glass',
        photoBig: 'assets/cocktails/StrawberryDaiquiriBig.png')
  ];
  EPageOnSelect page = EPageOnSelect.mainPage;
  int tag = 0;
  List<String> options = [
    'All',
    'Spirits',
    'Liqueurs',
    'Mixers',
    'Fruit Juices',
    'Bitters',
    'Soda and Cola',
    'Herbs and Spices',
    'Sweeteners',
    'Garnishes',
  ];
  List<IngredientItem> ingredients = [
    IngredientItem(name: 'Vodka', type: EIngredientType.spirits),
    IngredientItem(name: 'Gin', type: EIngredientType.spirits),
    IngredientItem(name: 'Rum (Light and Dark)', type: EIngredientType.spirits),
    IngredientItem(name: 'Tequila', type: EIngredientType.spirits),
    IngredientItem(name: 'Bourbon', type: EIngredientType.spirits),
    IngredientItem(
        name: 'Whiskey (Rye, Scotch, Irish)', type: EIngredientType.spirits),
    IngredientItem(name: 'Triple Sec', type: EIngredientType.liqueurs),
    IngredientItem(name: 'Grand Marnier', type: EIngredientType.liqueurs),
    IngredientItem(name: 'Amaretto', type: EIngredientType.liqueurs),
    IngredientItem(name: 'Baileys Irish Cream', type: EIngredientType.liqueurs),
    IngredientItem(name: 'Cointreau', type: EIngredientType.liqueurs),
    IngredientItem(name: 'Kahlúa', type: EIngredientType.liqueurs),
    IngredientItem(name: 'Fresh Lime Juice', type: EIngredientType.mixers),
    IngredientItem(name: 'Fresh Lemon Juice', type: EIngredientType.mixers),
    IngredientItem(name: 'Simple Syrup', type: EIngredientType.mixers),
    IngredientItem(name: 'Agave Nectar', type: EIngredientType.mixers),
    IngredientItem(name: 'Club Soda', type: EIngredientType.mixers),
    IngredientItem(name: 'Orange Juice', type: EIngredientType.fruitJuices),
    IngredientItem(name: 'Pineapple Juice', type: EIngredientType.fruitJuices),
    IngredientItem(name: 'Cranberry Juice', type: EIngredientType.fruitJuices),
    IngredientItem(name: 'Grapefruit Juice', type: EIngredientType.fruitJuices),
    IngredientItem(name: 'Apple Juice', type: EIngredientType.fruitJuices),
    IngredientItem(name: 'Angostura Bitters', type: EIngredientType.bitters),
    IngredientItem(name: 'Peychaud\'s Bitters', type: EIngredientType.bitters),
    IngredientItem(name: 'Orange Bitters', type: EIngredientType.bitters),
    IngredientItem(name: 'Cola', type: EIngredientType.sodaandCola),
    IngredientItem(name: 'Ginger Beer', type: EIngredientType.sodaandCola),
    IngredientItem(name: 'Sprite/7UP', type: EIngredientType.sodaandCola),
    IngredientItem(name: 'Tonic Water', type: EIngredientType.sodaandCola),
    IngredientItem(name: 'Mint Leaves', type: EIngredientType.herbsandSpices),
    IngredientItem(name: 'Basil Leaves', type: EIngredientType.herbsandSpices),
    IngredientItem(name: 'Cilantro', type: EIngredientType.herbsandSpices),
    IngredientItem(
        name: 'Cinnamon Sticks', type: EIngredientType.herbsandSpices),
    IngredientItem(name: 'Nutmeg', type: EIngredientType.herbsandSpices),
    IngredientItem(name: 'Simple Syrup', type: EIngredientType.sweeteners),
    IngredientItem(name: 'Agave Syrup', type: EIngredientType.sweeteners),
    IngredientItem(name: 'Grenadine', type: EIngredientType.sweeteners),
    IngredientItem(name: 'Honey', type: EIngredientType.sweeteners),
    IngredientItem(
        name: 'Maraschino Cherries', type: EIngredientType.garnishes),
    IngredientItem(name: 'Orange Twists', type: EIngredientType.garnishes),
  ];
  final InAppReview inAppReview = InAppReview.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF2B2F45), Color(0xFF0F1118)])),
            child: page == EPageOnSelect.mainPage
                ? Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(18, 60, 12, 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('RECIPES FOR COCKTAILS',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    fontSize: 15)),
                          ],
                        ),
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Column(
                        children: [
                          getContent(),
                        ],
                      ))),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                        child: customBottomNavigation(),
                      )
                    ],
                  )
                : page == EPageOnSelect.ingredientsPage
                    ? Column(children: [
                        Expanded(
                            child: Column(children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(18, 60, 18, 26),
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
                            child: ChipsChoice<int>.single(
                              choiceStyle: C2ChipStyle.filled(
                                  borderRadius: BorderRadius.circular(17),
                                  foregroundStyle: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 14),
                                  color: Colors.white,
                                  backgroundOpacity: 0.15,
                                  checkmarkColor: Colors.white,
                                  hoveredStyle: C2ChipStyle.filled(
                                      color: const Color(0xFFFF5C00)),
                                  selectedStyle: C2ChipStyle.filled(
                                      color: const Color(0xFFFF5C00))),
                              value: tag,
                              onChanged: (val) => setState(() => tag = val),
                              choiceItems: C2Choice.listFrom<int, String>(
                                source: options,
                                value: (i, v) => i,
                                label: (i, v) => v,
                              ),
                            ),
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 17),
                              child: getIngredients(),
                            ),
                          ))
                        ])),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(42, 15, 42, 15),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            SplashCocktailPage(
                                              cocktail: cocktails.elementAt(
                                                  Random().nextInt(
                                                      cocktails.length)),
                                            )),
                                  );
                                },
                                child: Container(
                                  height: 60,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(17),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: const Text(
                                    'Mix my cocktail',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
                              child: customBottomNavigation(),
                            ),
                          ],
                        )
                      ])
                    : Column(
                        children: [
                          Expanded(
                            child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(18, 60, 18, 0),
                                child: Column(children: [
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 26),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                      Navigator.of(context).push(
                                        MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                const ReadTermsOrPrivacyScreenView(
                                                  link:
                                                      'https://docs.google.com/document/d/15YNbESvURxgtRyWlgfd7S4f0QM7etvy3gLbyVlyNRIQ/edit?usp=sharing',
                                                  isAppBar: true,
                                                )),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 25, bottom: 25),
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
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                const ReadTermsOrPrivacyScreenView(
                                                  link:
                                                      'https://docs.google.com/document/d/1KfN08IKzVN9LZNJd05Z6vs5eFcwFZ1QZn35eKPmKqbM/edit?usp=sharing',
                                                  isAppBar: true,
                                                )),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 25, bottom: 25),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/icons/document.png',
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text('Terms & Conditions',
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      inAppReview.openStoreListing(
                                          appStoreId: '6473450756');
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 25, bottom: 25),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/icons/heart.png',
                                          ),
                                          const Flexible(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15),
                                              child: Text(
                                                  'Rate our app in the AppStore',
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ])),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
                            child: customBottomNavigation(),
                          )
                        ],
                      )),
      ),
    );
  }

  Widget customBottomNavigation() {
    return Container(
      padding: const EdgeInsets.fromLTRB(35, 14, 35, 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xFFFF5C00)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              page = EPageOnSelect.mainPage;
              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == EPageOnSelect.mainPage
                        ? Image.asset(
                            'assets/icons/GlassMartini.png',
                          )
                        : Image.asset(
                            'assets/icons/GlassMartini.png',
                            color: Colors.white.withOpacity(0.4),
                          ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text('Recipes',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 10)),
                    )
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              page = EPageOnSelect.ingredientsPage;
              setState(() {});
            },
            child: SizedBox(
                height: 70,
                width: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == EPageOnSelect.ingredientsPage
                        ? Image.asset(
                            'assets/icons/Orange.png',
                          )
                        : Image.asset(
                            'assets/icons/Orange.png',
                            color: Colors.white.withOpacity(0.4),
                          ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text('Ingredients',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 10)),
                    )
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              page = EPageOnSelect.settingsPage;
              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == EPageOnSelect.settingsPage
                        ? Image.asset(
                            'assets/icons/Settings.png',
                          )
                        : Image.asset(
                            'assets/icons/Settings.png',
                            color: Colors.white.withOpacity(0.4),
                          ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text('Settings',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 10)),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget getContent() {
    List<Widget> list = [];
    for (var cocktail in cocktails) {
      list.add(InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => CocktailPage(
                item: cocktail,
                fromgeneratePage: false,
              ),
            ),
          );
        },
        child: CocktailWidget(
          cocktail: cocktail,
        ),
      ));
    }
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: list,
    );
    // GridView.count(
    //   crossAxisSpacing: 20,
    //   mainAxisSpacing: 20,
    //   shrinkWrap: true,
    //   crossAxisCount: 2,
    //   childAspectRatio: 165 / 197,
    //   children: list,
    // );
  }

  Widget getIngredients() {
    List<Widget> list = [];

    var items = groupBy(ingredients, (IngredientItem e) {
      return e.type;
    });
    items.forEach((type, ingredients) {
      if (type == EIngredientType.spirits && (tag == 1 || tag == 0)) {
        list.add(const Row(
          children: [
            Text('Spirits',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8F8F8F),
                    fontSize: 13)),
          ],
        ));
      }
      if (type == EIngredientType.liqueurs && (tag == 2 || tag == 0)) {
        list.add(const Row(
          children: [
            Text('Liqueurs',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8F8F8F),
                    fontSize: 13)),
          ],
        ));
      }
      if (type == EIngredientType.mixers && (tag == 3 || tag == 0)) {
        list.add(const Row(
          children: [
            Text('Mixers',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8F8F8F),
                    fontSize: 13)),
          ],
        ));
      }
      if (type == EIngredientType.fruitJuices && (tag == 4 || tag == 0)) {
        list.add(const Row(
          children: [
            Text('Fruit Juices',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8F8F8F),
                    fontSize: 13)),
          ],
        ));
      }
      if (type == EIngredientType.bitters && (tag == 5 || tag == 0)) {
        list.add(const Row(
          children: [
            Text('Bitters',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8F8F8F),
                    fontSize: 13)),
          ],
        ));
      }
      if (type == EIngredientType.sodaandCola && (tag == 6 || tag == 0)) {
        list.add(const Row(
          children: [
            Text('Soda and Cola',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8F8F8F),
                    fontSize: 13)),
          ],
        ));
      }
      if (type == EIngredientType.herbsandSpices && (tag == 7 || tag == 0)) {
        list.add(const Row(
          children: [
            Text('Herbs and Spices',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8F8F8F),
                    fontSize: 13)),
          ],
        ));
      }
      if (type == EIngredientType.sweeteners && (tag == 8 || tag == 0)) {
        list.add(const Row(
          children: [
            Text('Sweeteners',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8F8F8F),
                    fontSize: 13)),
          ],
        ));
      }
      if (type == EIngredientType.garnishes && (tag == 9 || tag == 0)) {
        list.add(const Row(
          children: [
            Text('Garnishes',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8F8F8F),
                    fontSize: 13)),
          ],
        ));
      }
      if (tag == 0) {
        for (var ingredient in ingredients) {
          bool selected = chosenIngredients.firstWhereOrNull(
                  (element) => element.name == ingredient.name) !=
              null;
          list.add(InkWell(
              onTap: () {
                if (selected) {
                  selected = false;
                  chosenIngredients.remove(ingredient);
                  setState(() {});
                } else {
                  selected = true;
                  chosenIngredients.add(ingredient);
                  setState(() {});
                }
              },
              child: ingredientWidget(
                  ingredient: ingredient, selected: selected)));
        }
      } else if (tag == 1) {
        for (var ingredient in ingredients
            .where((element) => element.type == EIngredientType.spirits)) {
          bool selected = chosenIngredients.firstWhereOrNull(
                  (element) => element.name == ingredient.name) !=
              null;
          list.add(InkWell(
              onTap: () {
                if (selected) {
                  selected = false;
                  chosenIngredients.remove(ingredient);
                  setState(() {});
                } else {
                  selected = true;
                  chosenIngredients.add(ingredient);
                  setState(() {});
                }
              },
              child: ingredientWidget(
                  ingredient: ingredient, selected: selected)));
        }
      } else if (tag == 2) {
        for (var ingredient in ingredients
            .where((element) => element.type == EIngredientType.liqueurs)) {
          bool selected = chosenIngredients.firstWhereOrNull(
                  (element) => element.name == ingredient.name) !=
              null;
          list.add(InkWell(
              onTap: () {
                if (selected) {
                  selected = false;
                  chosenIngredients.remove(ingredient);
                  setState(() {});
                } else {
                  selected = true;
                  chosenIngredients.add(ingredient);
                  setState(() {});
                }
              },
              child: ingredientWidget(
                  ingredient: ingredient, selected: selected)));
        }
      } else if (tag == 3) {
        for (var ingredient in ingredients
            .where((element) => element.type == EIngredientType.mixers)) {
          bool selected = chosenIngredients.firstWhereOrNull(
                  (element) => element.name == ingredient.name) !=
              null;
          list.add(InkWell(
              onTap: () {
                if (selected) {
                  selected = false;
                  chosenIngredients.remove(ingredient);
                  setState(() {});
                } else {
                  selected = true;
                  chosenIngredients.add(ingredient);
                  setState(() {});
                }
              },
              child: ingredientWidget(
                  ingredient: ingredient, selected: selected)));
        }
      } else if (tag == 4) {
        for (var ingredient in ingredients
            .where((element) => element.type == EIngredientType.fruitJuices)) {
          bool selected = chosenIngredients.firstWhereOrNull(
                  (element) => element.name == ingredient.name) !=
              null;
          list.add(InkWell(
              onTap: () {
                if (selected) {
                  selected = false;
                  chosenIngredients.remove(ingredient);
                  setState(() {});
                } else {
                  selected = true;
                  chosenIngredients.add(ingredient);
                  setState(() {});
                }
              },
              child: ingredientWidget(
                  ingredient: ingredient, selected: selected)));
        }
      } else if (tag == 5) {
        for (var ingredient in ingredients
            .where((element) => element.type == EIngredientType.bitters)) {
          bool selected = chosenIngredients.firstWhereOrNull(
                  (element) => element.name == ingredient.name) !=
              null;
          list.add(InkWell(
              onTap: () {
                if (selected) {
                  selected = false;
                  chosenIngredients.remove(ingredient);
                  setState(() {});
                } else {
                  selected = true;
                  chosenIngredients.add(ingredient);
                  setState(() {});
                }
              },
              child: ingredientWidget(
                  ingredient: ingredient, selected: selected)));
        }
      } else if (tag == 6) {
        for (var ingredient in ingredients
            .where((element) => element.type == EIngredientType.sodaandCola)) {
          bool selected = chosenIngredients.firstWhereOrNull(
                  (element) => element.name == ingredient.name) !=
              null;
          list.add(InkWell(
              onTap: () {
                if (selected) {
                  selected = false;
                  chosenIngredients.remove(ingredient);
                  setState(() {});
                } else {
                  selected = true;
                  chosenIngredients.add(ingredient);
                  setState(() {});
                }
              },
              child: ingredientWidget(
                  ingredient: ingredient, selected: selected)));
        }
      } else if (tag == 7) {
        for (var ingredient in ingredients.where(
            (element) => element.type == EIngredientType.herbsandSpices)) {
          bool selected = chosenIngredients.firstWhereOrNull(
                  (element) => element.name == ingredient.name) !=
              null;
          list.add(InkWell(
              onTap: () {
                if (selected) {
                  selected = false;
                  chosenIngredients.remove(ingredient);
                  setState(() {});
                } else {
                  selected = true;
                  chosenIngredients.add(ingredient);
                  setState(() {});
                }
              },
              child: ingredientWidget(
                  ingredient: ingredient, selected: selected)));
        }
      } else if (tag == 8) {
        for (var ingredient in ingredients
            .where((element) => element.type == EIngredientType.sweeteners)) {
          bool selected = chosenIngredients.firstWhereOrNull(
                  (element) => element.name == ingredient.name) !=
              null;
          list.add(InkWell(
              onTap: () {
                if (selected) {
                  selected = false;
                  chosenIngredients.remove(ingredient);
                  setState(() {});
                } else {
                  selected = true;
                  chosenIngredients.add(ingredient);
                  setState(() {});
                }
              },
              child: ingredientWidget(
                  ingredient: ingredient, selected: selected)));
        }
      } else if (tag == 1) {
        for (var ingredient in ingredients
            .where((element) => element.type == EIngredientType.spirits)) {
          bool selected = chosenIngredients.firstWhereOrNull(
                  (element) => element.name == ingredient.name) !=
              null;
          list.add(InkWell(
              onTap: () {
                if (selected) {
                  selected = false;
                  chosenIngredients.remove(ingredient);
                  setState(() {});
                } else {
                  selected = true;
                  chosenIngredients.add(ingredient);
                  setState(() {});
                }
              },
              child: ingredientWidget(
                  ingredient: ingredient, selected: selected)));
        }
      } else if (tag == 9) {
        for (var ingredient in ingredients
            .where((element) => element.type == EIngredientType.garnishes)) {
          bool selected = chosenIngredients.firstWhereOrNull(
                  (element) => element.name == ingredient.name) !=
              null;
          list.add(InkWell(
              onTap: () {
                if (selected) {
                  selected = false;
                  chosenIngredients.remove(ingredient);
                  setState(() {});
                } else {
                  selected = true;
                  chosenIngredients.add(ingredient);
                  setState(() {});
                }
              },
              child: ingredientWidget(
                  ingredient: ingredient, selected: selected)));
        }
      }
    });
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: list,
    );
  }

  Widget ingredientWidget(
      {required IngredientItem ingredient, required bool selected}) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 30,
      height: 72,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFFF5C00).withOpacity(0.15)
              : Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8),
          border: selected ? Border.all(color: const Color(0xFFFF5C00)) : null),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          ingredient.name!,
          style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

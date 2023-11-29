import 'package:cocktails_app/model/cocktail_item.dart';
import 'package:flutter/material.dart';

class CocktailPage extends StatefulWidget {
  const CocktailPage(
      {super.key, required this.item, required this.fromgeneratePage});
  final CocktailItem item;
  final bool fromgeneratePage;

  @override
  State<CocktailPage> createState() => _CocktailPageState();
}

class _CocktailPageState extends State<CocktailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(alignment: Alignment.topCenter, children: [
          Container(
            height: 338,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.item.photoBig!),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 60, 18, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/icons/arrow_left.png')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: constraints.maxHeight - 338 + 72,
              child: Column(children: [
                Container(
                  height: 70,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF2B2F45), Color(0xFF0F1118)])),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 22, 0, 22),
                    child: Row(
                      children: [
                        Text(widget.item.name!.toUpperCase(),
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(color: Color(0xFF0F1118)),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(23, 44, 18, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 5, bottom: 29),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Text('${widget.item.description1}',
                                          style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF8F8F8F),
                                              fontSize: 13)),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 29),
                                child: Divider(
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),
                              if (!widget.fromgeneratePage)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 29),
                                  child: Text('${widget.item.compound}',
                                      style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13)),
                                ),
                              if (!widget.fromgeneratePage)
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 29),
                                  child: Divider(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                              Text('${widget.item.description2}',
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF8F8F8F),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ]);
      }),
    );
  }
}

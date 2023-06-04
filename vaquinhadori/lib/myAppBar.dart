import 'package:flutter/material.dart';
import 'package:vaquinhadori/myTheme.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  static double _logoTile = 90;
  static double _logoPadding = 20;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: SizedBox(
          height: 1,
        )),
        Center(
          child: Image.asset(
            'assets/images/LogoVaquinhadoRi-simples-quadrado-semfundo.png',
            width: _logoTile,
          ),
        ),
        const Expanded(
            child: SizedBox(
          height: 1,
        )),
        SizedBox(
          height: _logoTile * 0.7,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: RichText(
              text: const TextSpan(
                  style:
                      TextStyle(fontSize: 30, fontFamily: MyTheme.tertiaryFont),
                  children: [
                    TextSpan(
                      style: TextStyle(
                          fontFamily: MyTheme.quaternaryFont,
                          color: MyTheme.almostWhite,
                          fontSize: 34),
                      text: "V",
                    ),
                    TextSpan(
                      style: TextStyle(
                          fontFamily: MyTheme.secundaryFont,
                          fontWeight: FontWeight.w500,
                          color: MyTheme.almostWhite),
                      text: "aquinha do ",
                    ),
                    TextSpan(
                      style: TextStyle(
                          fontFamily: MyTheme.quaternaryFont,
                          color: MyTheme.red,
                          fontSize: 34),
                      text: "R",
                    ),
                    TextSpan(
                      style: TextStyle(
                          fontFamily: MyTheme.secundaryFont,
                          fontWeight: FontWeight.w500,
                          color: MyTheme.almostWhite),
                      text: "icardo",
                    ),
                  ]),
            ),
          ),
        ),
        const Expanded(
            child: SizedBox(
          height: 1,
        )),
      ],
    );
  }
}

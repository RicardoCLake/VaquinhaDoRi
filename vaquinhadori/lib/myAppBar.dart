import 'package:flutter/material.dart';
import 'package:vaquinhadori/myTheme.dart';

class MyAppBarTitle extends StatelessWidget {
  const MyAppBarTitle({super.key});

  static double _logoHeight = 40;
  static double _logoPadding = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Row(
        children: [
          const Expanded(
              child: SizedBox(
            height: 1,
          )),
          Center(
            child: Image.asset(
              'assets/images/LogoVaquinhadoRi-simples-semfundo.png',
              height: _logoHeight,
            ),
          ),
          const Expanded(
              child: SizedBox(
            height: 1,
          )),
          SizedBox(
            height: _logoHeight * 1.4,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: RichText(
                text: const TextSpan(
                    style: TextStyle(
                        fontSize: 30, fontFamily: MyTheme.tertiaryFont),
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
      ),
    );
  }
}

class MyAppBarExpanded extends StatelessWidget {
  const MyAppBarExpanded({super.key});

  static double _logoTile = 90;
  static double _logoPadding = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
            child: SizedBox(
          width: 1,
        )),
        Center(
          child: Image.asset(
            'assets/images/LogoVaquinhadoRi-simples-quadrado-semfundo.png',
            height: _logoTile,
          ),
        ),
        const Expanded(
            child: SizedBox(
          width: 1,
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
          width: 1,
        )),
      ],
    );
  }
}

class MyAppBarBottom extends StatelessWidget {
  void Function() function1;
  void Function() function2;
  void Function() function3;

  final Widget _myDivider = const VerticalDivider(
    width: 10,
    color: MyTheme.almostWhite,
    indent: 4,
    endIndent: 4,
    thickness: 0.8,
  );

  final TextStyle _myTextStyle = const TextStyle(
      color: MyTheme.almostWhite,
      fontFamily: MyTheme.secundaryFont,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.italic,
      fontSize: 16);

  MyAppBarBottom({
    super.key,
    required this.function1,
    required this.function2,
    required this.function3,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
              child: TextButton(
                  onPressed: function1,
                  child: Text(
                    "Moi",
                    style: _myTextStyle,
                  ))),
          _myDivider,
          Expanded(
              child: TextButton(
                  onPressed: function2,
                  child: Text("L'école", style: _myTextStyle))),
          _myDivider,
          Expanded(
              child: TextButton(
                  onPressed: function3,
                  child: Text("Donations", style: _myTextStyle)))
        ],
      ),
    );
  }
}

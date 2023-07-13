import 'package:flutter/material.dart';
import 'package:vaquinhadori/donationInformations.dart';
import 'package:vaquinhadori/myTheme.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class PixButton extends StatefulWidget {
  const PixButton({super.key});

  @override
  State<PixButton> createState() => _PixButtonState();
}

class _PixButtonState extends State<PixButton> {
  bool _onHover = false;
  void _setHoverState(bool isIt) {
    setState(() {
      _onHover = isIt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onHover: _setHoverState,
        style: OutlinedButton.styleFrom(
          backgroundColor: _onHover ? MyTheme.gray : MyTheme.almostWhite,
          foregroundColor: null,
          side: const BorderSide(color: MyTheme.red, width: 2), //<-- SEE HERE
          shape: const ContinuousRectangleBorder(),
        ),
        onPressed: () {
          Clipboard.setData(
              const ClipboardData(text: "doe@vaquinhadori.com.br"));
          var snack = const SnackBar(
            shape: ContinuousRectangleBorder(),
            content: Text(
              "Chave PIX copiada!",
              style: TextStyle(color: MyTheme.almostWhite),
            ),
            backgroundColor: MyTheme.darkBlue,
            margin:
                EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 10),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            "Copiar PIX",
            style: TextStyle(
                fontSize: DefaultTextStyle.of(context).style.fontSize,
                color: MyTheme.red),
          ),
        ));
  }
}

class DonationPartition extends StatelessWidget {
  const DonationPartition({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: const TextStyle(color: MyTheme.almostWhite),
      child: Container(
          padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
          decoration: const BoxDecoration(
            color: MyTheme.lightblue,
          ),

          // child: Column(
          //   children: <Widget>[GetUserName('testDocument')],
          // ),
          child: Column(children: [
            Center(
              child: Column(children: [
                const Text(
                  "Como é possível me ajudar?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(height: 70),
                RichText(
                    text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                      TextSpan(
                          style: TextStyle(
                              fontSize:
                                  DefaultTextStyle.of(context).style.fontSize! +
                                      3,
                              color: MyTheme.almostWhite),
                          children: const [
                            TextSpan(text: "Faça uma doação via "),
                            TextSpan(
                                style: TextStyle(
                                    color: MyTheme.darkBlue,
                                    fontWeight: FontWeight.bold),
                                text: "pix"),
                            TextSpan(
                                style: TextStyle(color: MyTheme.almostWhite),
                                text: "!")
                          ])
                    ])),
                const SizedBox(height: 10),
                SelectableText.rich(TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const [
                      TextSpan(
                          style: TextStyle(color: MyTheme.almostWhite),
                          text: "Chave: "),
                      TextSpan(
                          style: TextStyle(
                              color: MyTheme.almostWhite,
                              fontWeight: FontWeight.bold),
                          text: "doe@vaquinhadori.com.br")
                    ])),
                const SizedBox(height: 20),
                const PixButton(),
              ]),
            ),
            const SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                                style: TextStyle(
                                    color: MyTheme.almostWhite,
                                    fontFamily: DefaultTextStyle.of(context)
                                        .style
                                        .fontFamily,
                                    fontSize: DefaultTextStyle.of(context)
                                        .style
                                        .fontSize),
                                children: const [
                                  TextSpan(text: "Prefere "),
                                  TextSpan(
                                      text: "outra forma",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text:
                                          " de transferência? Ou ficou com alguma "),
                                  TextSpan(
                                      text: "dúvida",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: "?")
                                ])),
                        const SizedBox(height: 16),
                        RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                                style: TextStyle(
                                    color: MyTheme.almostWhite,
                                    fontFamily: DefaultTextStyle.of(context)
                                        .style
                                        .fontFamily,
                                    fontSize: DefaultTextStyle.of(context)
                                        .style
                                        .fontSize),
                                children: const [
                                  TextSpan(
                                      text:
                                          "Por favor, entre em contato comigo via o "),
                                  TextSpan(
                                      text: "email",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: " do pix!"),
                                ])),
                      ],
                    )),
                const SizedBox(width: 40),
                const GetValueCounter(),
              ],
            ),
            const SizedBox(height: 60),
            const GetDonatorCount(),
            const SizedBox(height: 60),
            RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                    style: DefaultTextStyle.of(context).style.merge(TextStyle(
                        color: MyTheme.almostWhite,
                        fontFamily: MyTheme.primaryFont,
                        fontSize:
                            DefaultTextStyle.of(context).style.fontSize! - 3)),
                    children: [
                      TextSpan(text: "( Desenvolvido por: "),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = launchURL1,
                          text: "Ricardo",
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                      TextSpan(text: " e "),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = launchURL2,
                          text: "Gabriel",
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                      TextSpan(text: " )"),
                    ])),
            const SizedBox(height: 15),
          ])),
    );
  }
}

launchURL1() async {
  Uri url = Uri.parse('https://www.linkedin.com/in/ricardo-chiquetto-do-lago');
  if (await launchUrl(url)) {
  } else {
    throw 'Não foi possível carregar o site do Ricardo';
  }
}

launchURL2() async {
  Uri url = Uri.parse('https://www.linkedin.com/in/gmduarte/');
  if (await launchUrl(url)) {
  } else {
    throw 'Não foi possível carregar o site do Gabriel';
  }
}

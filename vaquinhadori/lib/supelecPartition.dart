import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:vaquinhadori/myTheme.dart';

class SupelecPartition extends StatelessWidget {
  const SupelecPartition({super.key});

  @override
  Widget build(BuildContext context) {
    double deltaFont = 1.8;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
      decoration: const BoxDecoration(
        color: MyTheme.almostWhite,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              'assets/images/logoCS.png',
              width: 100,
            ),
            const Expanded(child: SizedBox(height: 1)),
            const Text(
              "Para onde vou?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )
          ]),
          const SizedBox(height: 30),
          RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: const [
                    TextSpan(text: "A "),
                    TextSpan(
                        text: "École CentraleSupélec ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            "é a terceira escola de engenharia mais renomada da "),
                    TextSpan(
                        text: "França. ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "Sua formação contempla o conceito europeu de "),
                    TextSpan(
                        text: "Engenharia Generalista, ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            "que permite ao aluno escolher seu percurso acadêmico dentre as mais diferentes áreas.")
                  ])),
          const SizedBox(height: 50),
          Image.asset(
            'assets/images/ImagemClassificacaoSupelec.png',
            width: 200,
          ),
          const SizedBox(height: 20),
          Container(
              alignment: Alignment.topRight,
              height: DefaultTextStyle.of(context).style.height,
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                          style: TextStyle(
                            fontSize:
                                (DefaultTextStyle.of(context).style.fontSize)! -
                                    deltaFont,
                            color: MyTheme.red,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = launchURL,
                          text: "Segundo o portal ",
                        ),
                        TextSpan(
                          style: TextStyle(
                              fontSize: (DefaultTextStyle.of(context)
                                      .style
                                      .fontSize)! -
                                  deltaFont,
                              color: MyTheme.red,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()..onTap = launchURL,
                          text: "L'étudiant",
                        )
                      ]))),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

launchURL() async {
  Uri url = Uri.parse(
      'https://www.letudiant.fr/classements/classement-des-ecoles-d-ingenieurs.html#:~:text=En%202023%2C%20le%20trio%20de,à%20un%20important%20changement%20méthodologique.');
  if (await launchUrl(url)) {
  } else {
    throw 'Não foi possível carregar o site L\'étudiant';
  }
}

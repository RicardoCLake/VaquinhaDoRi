import 'package:flutter/material.dart';
import 'package:vaquinhadori/myTheme.dart';

class SupelecPartition extends StatelessWidget {
  const SupelecPartition({super.key});

  @override
  Widget build(BuildContext context) {
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
              width: 200,
            ),
            const Expanded(child: SizedBox(height: 1)),
            const Text(
              "Para onde vou?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
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
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}

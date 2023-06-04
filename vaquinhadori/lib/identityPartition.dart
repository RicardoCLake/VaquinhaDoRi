import 'package:flutter/material.dart';
import 'package:vaquinhadori/myTheme.dart';

class IdentityPartition extends StatelessWidget {
  const IdentityPartition({super.key});

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
            const Text(
              "Quem sou?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            const Expanded(child: SizedBox(height: 1)),
            Image.asset(
              'assets/images/perfil.png',
              height: 200,
            )
          ]),
          const SizedBox(height: 30),
          RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: const [
                    TextSpan(text: "Um "),
                    TextSpan(
                        text: "alegre ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            "estudante de engenharia elétrica da Escola Politécnica da USP que se interessa por telecomunicações e sonha desde pequeno em estudar na "),
                    TextSpan(
                        text: "França. ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: "\n\n"),
                    TextSpan(
                        text:
                            "Tenho levado bem a sério esses anos de Poli, mantenho uma "),
                    TextSpan(
                        text: "média 9,4 ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            "e fiz várias atividades extracurriculares. Porém, por diferentes razões, ainda não consegui nenhuma bolsa de estudos e, por isso, preciso da "),
                    TextSpan(
                        text: "sua ajuda.",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ])),
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const [
                      TextSpan(
                          style: TextStyle(
                            fontFamily: MyTheme.secundaryFont,
                            fontWeight: FontWeight.w300,
                          ),
                          children: [
                            TextSpan(
                                text:
                                    "\"Tenho a ambição de ir para fora conhecer visões e tecnologias além daquelas encontradas aqui. Porém, carrego um "),
                            TextSpan(
                                text: "coração brasileiro ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    " e que está determinado a voltar para trabalhar em terras tupiniquins.\""),
                          ]),
                    ])),
          ),
          Container(
            alignment: Alignment.topRight,
            height: DefaultTextStyle.of(context).style.height,
            child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    text: "~ Ricardo Chiquetto do Lago")),
          ),
        ],
      ),
    );
  }
}

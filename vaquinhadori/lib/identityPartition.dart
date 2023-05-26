import 'package:flutter/material.dart';
import 'package:vaquinhadori/myTheme.dart';

class IdentityPartition extends StatelessWidget {
  const IdentityPartition({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 90, horizontal: 30),
      decoration: const BoxDecoration(
        color: MyTheme.almostWhite,
      ),
      child: Column(
        children: <Widget>[
          Row(children: [
            const Text(
              "Quem sou?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Image.asset(
              'assets/images/perfil.png',
              height: 150,
            )
          ])
        ],
      ),
    );
  }
}

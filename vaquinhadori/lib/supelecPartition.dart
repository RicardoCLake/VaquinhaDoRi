import 'package:flutter/material.dart';
import 'package:vaquinhadori/myTheme.dart';

class SupelecPartition extends StatelessWidget {
  const SupelecPartition({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MyTheme.lightblue,
      ),
      child: Column(
        children: <Widget>[Text("teste")],
      ),
    );
  }
}

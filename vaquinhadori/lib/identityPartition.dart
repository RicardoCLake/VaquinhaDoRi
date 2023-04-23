import 'package:flutter/material.dart';
import 'package:vaquinhadori/myTheme.dart';

class IdentityPartition extends StatelessWidget {
  const IdentityPartition({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MyTheme.almostWhite,
      ),
      child: Column(
        children: <Widget>[Text("teste")],
      ),
    );
  }
}

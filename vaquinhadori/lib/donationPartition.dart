import 'package:flutter/material.dart';
import 'package:vaquinhadori/myTheme.dart';

class DonationPartition extends StatelessWidget {
  const DonationPartition({super.key});

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

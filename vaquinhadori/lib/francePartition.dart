import 'package:flutter/material.dart';
import 'package:vaquinhadori/myTheme.dart';

class FrancePartition extends StatelessWidget {
  const FrancePartition({Key? key}) : super(key: key);
  final double _height = 50.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: _height,
          width: MediaQuery.of(context).size.width / 3,
          decoration: const BoxDecoration(color: MyTheme.darkBlue),
          child: const SizedBox(),
        ),
        Container(
          height: _height,
          width: MediaQuery.of(context).size.width / 3,
          decoration: const BoxDecoration(color: MyTheme.fullWhite),
          child: const SizedBox(),
        ),
        Container(
          height: _height,
          width: MediaQuery.of(context).size.width / 3,
          decoration: const BoxDecoration(color: MyTheme.red),
          child: const SizedBox(),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vaquinhadori/supelecPartition.dart';
import 'package:vaquinhadori/francePartition.dart';
import 'package:vaquinhadori/donationPartition.dart';
import 'package:vaquinhadori/identityPartition.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  final String title = 'Vaquinha do Ricardo';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _donationCounter = 0;
  int _donationPresentValue = 0;
  int _donationGoalValue = 0;

  void _copyPixKey() {
    //TODO
  }

  Widget? partitionsBuilder(BuildContext context, int partitionID) {
    switch (partitionID) {
      case 0:
        return const IdentityPartition();
      case 1:
        return const FrancePartition();
      case 2:
        return const SupelecPartition();
      case 3:
        return const FrancePartition();
      default:
        return const DonationPartition();
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: partitionsBuilder,
        itemCount: 5,
        //controller: to change position in appbar
      ),
      //floatingActionButton: FloatingActionButton(
      //  onPressed: _copyPixKey,
      //  tooltip: 'Increment',
      //  child: const Icon(Icons.add),
    );
  }
}

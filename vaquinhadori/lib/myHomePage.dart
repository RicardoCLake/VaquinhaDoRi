import 'package:flutter/material.dart';
import 'package:vaquinhadori/myTheme.dart';
import 'package:vaquinhadori/supelecPartition.dart';
import 'package:vaquinhadori/francePartition.dart';
import 'package:vaquinhadori/donationPartition.dart';
import 'package:vaquinhadori/identityPartition.dart';
import 'package:vaquinhadori/myAppBar.dart';

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
  late ScrollController _scrollController;
  late bool isPc;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.of(context).size.width > 800) {
      isPc = true;
    } else {
      isPc = false;
    }
  }

  Widget? partitionsBuilder(BuildContext context, int partitionID) {
    if (isPc) {
      return partitionsBuilder2(context, partitionID);
    } //else
    return partitionsBuilder1(context, partitionID);
  }

  Widget? partitionsBuilder1(BuildContext context, int partitionID) {
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

  Widget? partitionsBuilder2(BuildContext context, int partitionID) {
    switch (partitionID) {
      case 0:
        return Container(
          decoration: const BoxDecoration(
            color: MyTheme.almostWhite,
          ),
          child: const UnconstrainedBox(
              child: LimitedBox(maxWidth: 700, child: IdentityPartition())),
        );
      case 1:
        return const FrancePartition();
      case 2:
        return Container(
          decoration: const BoxDecoration(
            color: MyTheme.almostWhite,
          ),
          child: const UnconstrainedBox(
              child: LimitedBox(maxWidth: 700, child: SupelecPartition())),
        );
      case 3:
        return const FrancePartition();
      default:
        return Container(
          decoration: const BoxDecoration(
            color: MyTheme.lightblue,
          ),
          child: const UnconstrainedBox(
              child: LimitedBox(maxWidth: 700, child: DonationPartition())),
        );
    }
  }

  void _scrollToIdentity() {
    _scrollController.animateTo(
      0, // Posição específica na lista
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToSupelec() {
    _scrollController.animateTo(
      isPc ? 725 : 925, //calculo exato de identity+france
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToDonation() {
    _scrollController.animateTo(
      isPc ? 1242 : 1642, //calculo exato de identity+france+supelec+france
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          centerTitle: false,
          elevation: 10,
          surfaceTintColor: MyTheme.almostBlack,
          toolbarHeight: 90,
          title: const MyAppBarTitle(),
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: MyAppBarBottom(
              function1: _scrollToIdentity,
              function2: _scrollToSupelec,
              function3: _scrollToDonation,
            ),
          ),
        ),
        body: ListView.builder(
            itemBuilder: partitionsBuilder,
            itemCount: 5,
            controller: _scrollController)
        //floatingActionButton: FloatingActionButton(
        //  onPressed: _copyPixKey,
        //  tooltip: 'Increment',
        //  child: const Icon(Icons.add),
        );
  }
}

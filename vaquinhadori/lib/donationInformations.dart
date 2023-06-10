import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vaquinhadori/myTheme.dart';

class Transaction {
  final num amount;
  final String donatorName;
  final num aggregatedDonations;
  final num donatorCount;

  Transaction(this.amount, this.donatorName, this.aggregatedDonations,
      this.donatorCount);
}

class GetValueCounter extends StatelessWidget {
  const GetValueCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('transactions')
          .orderBy("donationDateTime", descending: true)
          .limit(1)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Erro ao carregar dados.");
        }
        if (!snapshot.hasData) {
          return const Text("Erro ao carregar dados");
        }
        Map<String, dynamic> data =
            snapshot.data?.docs.first.data() as Map<String, dynamic>;
        var numFormat = NumberFormat("######.00", "pt_BR");
        if (snapshot.connectionState == ConnectionState.done) {
          return Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                            style: const TextStyle(
                                color: MyTheme.darkBlue,
                                fontWeight: FontWeight.bold),
                            text:
                                "R\$ ${numFormat.format(data["aggregatedDonations"])}")
                      ]),
                ),
                LinearProgressIndicator(
                  value: data["aggregatedDonations"] / 20000,
                  backgroundColor: MyTheme.almostWhite,
                  color: MyTheme.darkBlue,
                  minHeight: 16,
                ),
                Container(
                  alignment: Alignment.topRight,
                  height: DefaultTextStyle.of(context).style.height,
                  child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          style: DefaultTextStyle.of(context)
                              .style
                              .copyWith(color: MyTheme.almostWhite),
                          text: "R\$ 20.000,00")),
                ),
                const SizedBox(height: 40),
                Container(
                  alignment: Alignment.topRight,
                  height: DefaultTextStyle.of(context).style.height,
                  child: RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                          style: DefaultTextStyle.of(context)
                              .style
                              .copyWith(fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                                style: TextStyle(
                                  color: MyTheme.darkBlue,
                                  fontSize: DefaultTextStyle.of(context)
                                          .style
                                          .fontSize! -
                                      3,
                                ),
                                text: "*Atualizado a cada 24 horas")
                          ])),
                ),
              ],
            ),
          );
        }

        return const Text("Carregando informações...");
      },
    );
  }
}

class GetDonatorCount extends StatelessWidget {
  const GetDonatorCount({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('transactions')
          .orderBy("donationDateTime", descending: true)
          .limit(1)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Erro ao carregar dados.");
        }
        if (!snapshot.hasData) {
          return const Text("Erro ao carregar dados");
        }
        Map<String, dynamic> data =
            snapshot.data?.docs.first.data() as Map<String, dynamic>;
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
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
                                TextSpan(text: "“Meu "),
                                TextSpan(
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    text: "muito obrigado"),
                                TextSpan(text: " aos mais de "),
                              ]),
                        ])),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          TextSpan(
                              style: const TextStyle(
                                fontFamily: MyTheme.secundaryFont,
                                fontWeight: FontWeight.w300,
                              ),
                              children: [
                                TextSpan(
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    text: "${data["donatorCount"]} doadores"),
                                const TextSpan(text: "!”"),
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
                        children: [
                          TextSpan(
                              style: TextStyle(
                                  fontSize: DefaultTextStyle.of(context)
                                          .style
                                          .fontSize! -
                                      1.5),
                              text: "~ Ricardo Chiquetto do Lago")
                        ])),
              ),
            ],
          );
        }

        return const Text("Carregando informações...");
      },
    );
  }
}

//class GetUserName extends StatelessWidget {
//  final String documentId;
//
//  const GetUserName(this.documentId, {super.key});
//
//  @override
//  Widget build(BuildContext context) {
//    CollectionReference test =
//        FirebaseFirestore.instance.collection('testCollection');
//
//    return FutureBuilder<DocumentSnapshot>(
//      future: test.doc(documentId).get(),
//      builder:
//          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//        if (snapshot.hasError) {
//          return const Text("Something went wrong");
//        }
//
//        if (snapshot.hasData && !snapshot.data!.exists) {
//          return const Text("Document does not exist");
//        }
//
//        if (snapshot.connectionState == ConnectionState.done) {
//          Map<String, dynamic> data =
//              snapshot.data!.data() as Map<String, dynamic>;
//          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
//        }
//
//        return const Text("loading");
//      },
//    );
//  }
//}



import 'package:flutter/material.dart';
import 'package:vaquinhadori/myTheme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Transaction {
  final num amount;
  final String donatorName;
  final num aggregatedDonations;
  final num donatorCount;

  Transaction(this.amount, this.donatorName, this.aggregatedDonations,
      this.donatorCount);
}

class GetLastTransaction extends StatelessWidget {
  const GetLastTransaction({super.key});

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
          return Text("Atingido: ${data["aggregatedDonations"]} ");
          // return const LinearProgressIndicator(value: 50);
        }

        return const Text("Carregando informações...");
      },
    );
  }
}

class GetUserName extends StatelessWidget {
  final String documentId;

  const GetUserName(this.documentId, {super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference test =
        FirebaseFirestore.instance.collection('testCollection');

    return FutureBuilder<DocumentSnapshot>(
      future: test.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return const Text("loading");
      },
    );
  }
}

class DonationPartition extends StatelessWidget {
  const DonationPartition({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MyTheme.almostWhite,
      ),
      // child: Column(
      //   children: <Widget>[GetUserName('testDocument')],
      // ),
      child: Column(
        children: const <Widget>[GetLastTransaction()],
      ),
    );
  }
}

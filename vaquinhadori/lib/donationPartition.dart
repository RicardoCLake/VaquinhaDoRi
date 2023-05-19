import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          return RichText(
              text: TextSpan(children: [
            TextSpan(
                text:
                    "“Meu muito obrigado aos mais de ${data["donatorCount"]} doadores!!”")
          ]));
          // return const LinearProgressIndicator(value: 50);
        }

        return const Text("Carregando informações...");
      },
    );
  }
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
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: MyTheme.almostWhite,
        ),
        // child: Column(
        //   children: <Widget>[GetUserName('testDocument')],
        // ),

        child: Column(children: [
          Center(
            child: Column(children: [
              const Text("Como é possível me ajudar?"),
              const Text("Faça uma doação via pix"),
              const Text("Chave: doe@vaquinhadori.com.br"),
              const SizedBox(height: 16),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    // backgroundColor: Colors.black,
                    // primary: Colors.white,
                    side: const BorderSide(
                        color: MyTheme.darkBlue, width: 1), //<-- SEE HERE
                  ),
                  onPressed: () {
                    Clipboard.setData(
                        const ClipboardData(text: "doe@vaquinhadori.com.br"));
                    var snack =
                        const SnackBar(content: Text("Chave PIX copiada!"));
                    ScaffoldMessenger.of(context).showSnackBar(snack);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Copiar PIX",
                      style: TextStyle(fontSize: 20),
                    ),
                  ))
            ]),
          ),
          const SizedBox(height: 32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RichText(
                      textAlign: TextAlign.start,
                      text: const TextSpan(children: [
                        TextSpan(
                            text:
                                "Prefere outra forma de transferência? Ou ficou com alguma dúvida?")
                      ])),
                  const SizedBox(height: 16),
                  RichText(
                      textAlign: TextAlign.start,
                      text: const TextSpan(children: [
                        TextSpan(
                            text:
                                "Por favor, entre em contato comigo via o email do pix!")
                      ])),
                ],
              )),
              const SizedBox(width: 8),
              const GetLastTransaction(),
            ],
          ),
          const SizedBox(height: 32),
          const GetDonatorCount(),
          RichText(
              text: const TextSpan(
                  children: [TextSpan(text: "- Ricardo Chiquetto do Lago")])),
        ]));
  }
}

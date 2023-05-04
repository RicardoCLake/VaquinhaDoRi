import 'package:flutter/material.dart';
import 'package:vaquinhadori/myTheme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference test = FirebaseFirestore.instance.collection('testCollection');

    return FutureBuilder<DocumentSnapshot>(
      future: test.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
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
      child: Column(
        children: <Widget>[GetUserName('testDocument')],
      ),
    );
  }
}

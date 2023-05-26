import { DocumentSnapshot, Timestamp } from "firebase-admin/firestore";
import { firestore, https, logger } from "firebase-functions";

// The Firebase Admin SDK to access Firestore.
const admin = require("firebase-admin");
admin.initializeApp();

interface TransactionInput {
  donatorName: string;
  amount: number;
  donationDateTime: string | Timestamp; // timestamp
}

interface TransactionProcessed extends TransactionInput {
  donatorCount: number;
  aggregatedDonations: number;
  createdAt: Date;
  updatedAt: Date;
}

// // Start writing functions
// // https://firebase.google.com/docs/functions/typescript
//
export const helloWorld = https.onRequest((request, response) => {
  logger.info("Hello logs!", { structuredData: true });
  response.send("Hello from Vaquinha Do Ri!");
});

export const listData = https.onRequest(async (request, response) => {
  logger.info("Hello ListData!", { structuredData: true });
  const donations = await admin
    .firestore()
    .collection("transactions")
    .orderBy("donationDateTime", "desc")
    //   .limit(2)
    .get();
  const donationsData = donations.docs.map(
    (doc: DocumentSnapshot<TransactionProcessed>) => {
      const data = doc.data();
      if (!data) return null;
      const timestamp = data.donationDateTime as Timestamp;
      return {
        donatorName: data.donatorName,
        amount: data.amount,
        donationDateTime: timestamp.toDate().toISOString(),
        donatorCount: data.donatorCount,
        aggregatedDonations: data.aggregatedDonations,
      };
    }
  );
  response.status(200).json(donationsData);
});

export const addTransaction = https.onRequest(async (request, response) => {
  if (request.method !== "POST") {
    response.status(400).send(`Can not ${request.method}`);
  }
  const { donatorName, donationDateTime, amount } = request.body;
  if (!donatorName) response.status(400).send("donatorName not provided");
  if (!donationDateTime)
    response.status(400).send("donationDateTime not provided");
  if (!amount) response.status(400).send("amount not provided");

  // Validate datetime
  const dateTimeRegex =
    /^\d{4}-\d\d-\d\dT\d\d:\d\d:\d\d(\.\d+)?(([+-]\d\d:\d\d)|Z)$/;

  if (!RegExp(dateTimeRegex).test(donationDateTime)) {
    response.status(400).send("Invalid iso string at donationDateTime");
  }

  const timestamp = new Date(donationDateTime);

  const now = new Date();

  await admin.firestore().collection("transactions").add({
    donatorName,
    donationDateTime: timestamp,
    amount,
    createdAt: now,
    updatedAt: now,
  });
  response.status(200).send("Transaction added");
});

export const onTransactionCreated = firestore
  .document("transactions/{docId}")
  .onCreate(async (snap, context) => {
    const snapshot = snap;
    if (!snapshot) {
      console.log("No data associated with the event");
      return;
    }
    const data = snapshot.data();
    const createdDocId = snapshot.id;
    const lastTransaction = await fetchLastTransaction();

    return await processTransaction({
      createdDocId,
      donatedAmount: data.amount,
      lastDonatorCount: lastTransaction ? lastTransaction.donatorCount : 0,
      lastTotalAmount: lastTransaction
        ? lastTransaction.aggregatedDonations
        : 0,
    });
  });

async function processTransaction(input: {
  createdDocId: string;
  donatedAmount: number;
  lastDonatorCount: number;
  lastTotalAmount: number;
}) {
  const now = new Date();
  const { createdDocId, donatedAmount, lastDonatorCount, lastTotalAmount } =
    input;
  const updateDoc = await admin
    .firestore()
    .doc(`transactions/${createdDocId}`)
    .update({
      donatorCount: lastDonatorCount + 1,
      aggregatedDonations: lastTotalAmount + donatedAmount,
      updatedAt: now,
    });
  return updateDoc;
}

async function fetchLastTransaction(): Promise<TransactionProcessed | null> {
  const lastDonation = await admin
    .firestore()
    .collection("transactions")
    .orderBy("donationDateTime", "desc")
    .limit(2)
    .get();
  return lastDonation.docs[1]?.data() ?? (null as TransactionProcessed | null);
}

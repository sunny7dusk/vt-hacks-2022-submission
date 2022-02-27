import 'package:cloud_firestore/cloud_firestore.dart';

class Source {
  late final String credibility;
  late final String bias;
  late final String factuality;

  Source._(
      {required this.credibility,
      required this.bias,
      required this.factuality});

  static Future<Source> loadFromDomain(final String domain) async {
    CollectionReference sources =
        FirebaseFirestore.instance.collection('news-sources');

    DocumentReference doc = sources.doc(domain);

    DocumentSnapshot snapshot = await doc.get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

      return Source._(
          credibility: data['credibility'],
          bias: data['bias'],
          factuality: data['factuality']);
    } else {
      throw StateError('This source is not in the database!');
    }
  }
}

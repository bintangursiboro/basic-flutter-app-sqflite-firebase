import 'package:cloud_firestore/cloud_firestore.dart';

class HomePageFirestore {
  final databaseReference = Firestore.instance;

  Future<void> saveToFirestore(String name) async {
    try {
      await databaseReference.collection('student').add({'nama': name});
    } catch (e) {}
  }

  Future<String> fetchFromFirestore() async {
    String name;
    try {
      await databaseReference
          .collection('student')
          .getDocuments()
          .then((QuerySnapshot querySnapshot) {
        name = querySnapshot.documents.first.data['nama'];
      });
    } catch (e) {}
    if (name != null) {
      return name;
    }
    throw Exception;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kr_app/domain/member.dart';

Future<List<Member>> fetchMembersList() async {
  final QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('users')
      .orderBy('latestPost', descending: true)
      .get();

  return snapshot.docs.map((DocumentSnapshot document) {
    return Member(document);
  }).toList();
}

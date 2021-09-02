import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kr_app/domain/member.dart';

Future<Member> fetchMyAccount() async {
  final myUserId = FirebaseAuth.instance.currentUser!.uid;
  final DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('users').doc(myUserId).get();
  return Member(snapshot);
}

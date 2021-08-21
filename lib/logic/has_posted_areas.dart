import 'package:cloud_firestore/cloud_firestore.dart';

List<String>? postPrefectureAndArea;

void fetchExistAreas() async {
  final QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('areas').get();
  final List<String> prefecteAndArea =
      snapshot.docs.map((DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    final String prefectureAndArea = data['prefectureAndArea'];
    return prefectureAndArea;
  }).toList();

  postPrefectureAndArea = prefecteAndArea;
}

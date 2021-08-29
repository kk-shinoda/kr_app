import 'package:cloud_firestore/cloud_firestore.dart';

List<String>? alreadyPostArea;

void fetchExistAreas() async {
  final QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('areas').get();
  final List<String> areas = snapshot.docs.map((DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    final String area = data['area'];
    return area;
  }).toList();

  alreadyPostArea = areas;
}

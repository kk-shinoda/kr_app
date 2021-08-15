import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  Post(DocumentSnapshot doc) {
    userId = doc['userId'];
    createdAt = doc['createdAt'];
    comment = doc['comment'];
    area = doc['area'];
    category = doc['category'];
    amount = doc['amount'];
  }

  String? userId;
  Timestamp? createdAt;
  String? comment;
  String? area;
  String? category;
  int? amount;
}

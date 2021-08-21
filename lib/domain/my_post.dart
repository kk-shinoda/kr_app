import 'package:cloud_firestore/cloud_firestore.dart';

class MyPost {
  MyPost(DocumentSnapshot doc) {
    this.comment = doc['comment'];
    this.type = doc['type'];
    this.amount = doc['amount'];
    this.postDate = doc['post_date'];
  }

  int? postDate;
  String? comment;
  String? type;
  int? amount;
}

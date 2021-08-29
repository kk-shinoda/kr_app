import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  Post(DocumentSnapshot doc) {
    this.userId = doc['userId'];
    this.comment = doc['comment'];
    this.area = doc['area'];
    this.type = doc['type'];
    this.amount = doc['amount'];
    this.postDate = doc['post_date'];
  }

  String? userId;
  String? postDate;
  String? comment;
  String? area;
  String? type;
  int? amount;
}

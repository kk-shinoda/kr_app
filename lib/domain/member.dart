import 'package:cloud_firestore/cloud_firestore.dart';

import 'post.dart';

class Member {
  Member(DocumentSnapshot doc) {
    userId = doc.id;
    iconImageURL = doc['iconImageURL'];
    userName = doc['userName'];
    sex = doc['sex'];
    prefecture = doc['prefecture'];
    area = doc['area'];
    introduction = doc['introduction'];
    latestPost = doc['latestPost'];
    post = doc['post'];
  }

  String? userId;
  String? iconImageURL;
  String? userName;
  String? sex;
  String? prefecture;
  String? area;
  String? introduction;
  Timestamp? latestPost;
  Post? post;
}

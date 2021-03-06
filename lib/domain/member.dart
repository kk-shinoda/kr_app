import 'package:cloud_firestore/cloud_firestore.dart';

class Member {
  Member(DocumentSnapshot doc) {
    userId = doc['userId'];
    // iconImageURL = doc['iconImageURL'];
    userName = doc['userName'];
    sex = doc['sex'];
    prefecture = doc['prefecture'];
    area = doc['area'];
    introduction = doc['introduction'];
    latestPost = doc['latestPost'];
    isCommentPublic = doc['isCommentPublic'];
  }

  String? userId;
  // String? iconImageURL;
  String? userName;
  String? sex;
  String prefecture = 'UNSELECTED';
  String area = 'UNSELECTED';
  String introduction = '';
  Timestamp? latestPost;
  bool? isCommentPublic;
}

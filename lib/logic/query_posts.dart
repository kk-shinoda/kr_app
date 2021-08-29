import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kr_app/domain/my_post.dart';

Future queryFromUserId(String userId) async {
  List<MyPost> postsAll = await fetchPostList(userId);
  List<MyPost> postsBefore = [];
  List<MyPost> postsFourMonthAgo = [];
  List<MyPost> postsThreeMonthAgo = [];
  List<MyPost> postsTwoMonthAgo = [];
  List<MyPost> postsLastMonth = [];
  List<MyPost> postsThisMonth = [];

  int sumAll = 0;
  int sumBefore = 0;
  int sumFourMonthAgo = 0;
  int sumThreeMonthAgo = 0;
  int sumTwoMonthAgo = 0;
  int sumLastMonth = 0;
  int sumThisMonth = 0;

  int thisMonth = parseDate(DateTime.now().toString());

  postsAll.forEach((element) {
    int postMonth = (element.postDate! / 100).floor();
    sumAll += element.amount!;
    if (postMonth == thisMonth) {
      postsThisMonth.add(element);
      sumThisMonth += element.amount!;
    } else if (postMonth == thisMonth - 1) {
      postsLastMonth.add(element);
      sumLastMonth += element.amount!;
    } else if (postMonth == thisMonth - 2) {
      postsTwoMonthAgo.add(element);
      sumTwoMonthAgo += element.amount!;
    } else if (postMonth == thisMonth - 3) {
      postsThreeMonthAgo.add(element);
      sumThreeMonthAgo += element.amount!;
    } else if (postMonth == thisMonth - 4) {
      postsFourMonthAgo.add(element);
      sumFourMonthAgo += element.amount!;
    } else {
      postsBefore.add(element);
      sumBefore += element.amount!;
    }
  });

  return [
    [
      postsBefore,
      postsFourMonthAgo,
      postsThreeMonthAgo,
      postsTwoMonthAgo,
      postsLastMonth,
      postsThisMonth,
      postsAll
    ],
    [
      sumBefore,
      sumFourMonthAgo,
      sumThreeMonthAgo,
      sumTwoMonthAgo,
      sumLastMonth,
      sumThisMonth,
      sumAll
    ]
  ];
}

Future<List<MyPost>> fetchPostList(String userId) async {
  final QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('myposts')
      .orderBy('post_date', descending: true)
      .get();

  return snapshot.docs.map((DocumentSnapshot document) {
    return MyPost(document);
  }).toList();
}

int parseDate(String strDate) {
  String tmp = strDate.substring(0, 4) + strDate.substring(5, 7);
  return int.parse(tmp);
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

BoxDecoration kBackgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Colors.green.withOpacity(0.15),
        Colors.orange.withOpacity(0.1),
        Colors.orange.withOpacity(0.15)
      ]),
);

ButtonStyle kButtonStyleForm =
    ElevatedButton.styleFrom(primary: Colors.brown.shade400);

AppBar commonAppBar(String title) {
  return AppBar(title: Text(title), backgroundColor: Colors.brown.shade400);
}

Widget buildBankList(String postDate, int amount, String comment,
    [bool isCommentPublic = true]) {
  final formatterE = NumberFormat("##0.0#");
  final formatterG = NumberFormat("###");
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
    child: Card(
      child: comment == "" || !isCommentPublic
          ? InkWell(
              onLongPress: () {},
              child: ListTile(
                trailing: Icon(
                  Icons.expand_more,
                  color: Colors.amber.withAlpha(0),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(formatDate(postDate)),
                    Text(formatterG.format(amount).toString() + "グラム"),
                    Text(formatterE.format((amount * 0.03)).toString() + "円"),
                  ],
                ),
              ),
            )
          : InkWell(
              onLongPress: () {},
              child: ExpansionTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(formatDate(postDate)),
                    Text(formatterG.format(amount).toString() + "グラム"),
                    Text(formatterE.format((amount * 0.03)).toString() + "円"),
                  ],
                ),
                children: [
                  ListTile(
                    title: Text(comment),
                  )
                ],
              ),
            ),
    ),
  );
}

String formatDate(String postDate) {
  return postDate.substring(0, 4) +
      "年" +
      postDate.substring(4, 6) +
      "月" +
      postDate.substring(6, 8) +
      "日";
}

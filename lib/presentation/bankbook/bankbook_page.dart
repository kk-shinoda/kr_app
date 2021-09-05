import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kr_app/common/constants.dart';
import 'package:kr_app/logic/get_tabbar_month.dart';
import 'package:kr_app/presentation/bankbook/bankbook_model.dart';
import 'package:provider/provider.dart';

class BankBookPage extends StatelessWidget {
  static List<String> tabMonths = getTabbarMonth();
  List<Tab> tabs = <Tab>[
    Tab(text: 'それ以前'),
    Tab(text: tabMonths[0]),
    Tab(text: tabMonths[1]),
    Tab(text: tabMonths[2]),
    Tab(text: '先月'),
    Tab(text: '今月'),
    Tab(text: '全期間'),
  ];

  TabBar get _tabBar => TabBar(
        isScrollable: true,
        tabs: [
          Tab(text: 'それ以前'),
          Tab(text: tabMonths[0]),
          Tab(text: tabMonths[1]),
          Tab(text: tabMonths[2]),
          Tab(text: '先月'),
          Tab(text: '今月'),
          Tab(text: '全期間'),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BankBookModel(context),
      child: Consumer<BankBookModel>(builder: (context, model, child) {
        return DefaultTabController(
          initialIndex: 5,
          length: 7,
          child: Builder(builder: (BuildContext context) {
            final TabController tabController =
                DefaultTabController.of(context)!;
            tabController.addListener(() {
              if (!tabController.indexIsChanging) {
                model.turnThePage(tabController.index);
              }
            });
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 108,
                backgroundColor: Colors.brown.shade400,
                title: Text('通帳'),
                actions: [
                  TextButton(
                    onPressed: () => model.fetchData(),
                    child: Icon(Icons.refresh, color: Colors.lime.shade100),
                  )
                ],
                bottom: PreferredSize(
                    preferredSize: _tabBar.preferredSize,
                    child: Container(
                      height: 48,
                      color: Colors.brown.shade700.withOpacity(0.2),
                      child: _tabBar,
                    )),
              ),
              backgroundColor: Colors.orange.shade50,
              body: model.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: kBackgroundDecoration,
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: TabBarView(
                                children: tabs.map((Tab tab) {
                                  return Scrollbar(
                                    child: model.isLoading
                                        ? Center(child: Text('loading'))
                                        : ListView.builder(
                                            itemBuilder: (context, i) => model
                                                        .posts![
                                                            tabController.index]
                                                        .length <=
                                                    i
                                                ? Text('')
                                                : _buildBankList(
                                                    model
                                                        .posts![tabController.index]
                                                            [i]
                                                        .postDate
                                                        .toString(),
                                                    model
                                                        .posts![tabController.index]
                                                            [i]
                                                        .amount!,
                                                    model
                                                        .posts![tabController.index]
                                                            [i]
                                                        .comment!,
                                                    context,
                                                    model,
                                                    model
                                                        .posts![tabController.index]
                                                            [i]
                                                        .postId!),
                                            itemCount: model
                                                .posts![tabController.index]
                                                .length,
                                          ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 80,
                            color: Colors.brown.shade400.withOpacity(0.6),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                model.totalInfo,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black87,
                                    fontFamily: "KaiseiTokumin"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            );
          }),
        );
      }),
    );
  }

  Widget _buildBankList(String postDate, int amount, String comment,
      BuildContext context, BankBookModel model, String postId) {
    final formatterE = NumberFormat("##0.0#");
    final formatterG = NumberFormat("###");
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Card(
        child: comment == ""
            ? InkWell(
                onLongPress: () {
                  _showDialog(context, 'この投稿を削除しますか？', postId, model);
                },
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
                onLongPress: () {
                  _showDialog(context, 'この投稿を削除しますか？', postId, model);
                },
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

  Future _showDialog(BuildContext context, String title, String postId,
      BankBookModel model) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: [
            TextButton(
              child: const Text('いいえ'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'はい',
              ),
              onPressed: () async {
                model.deletePost(postId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

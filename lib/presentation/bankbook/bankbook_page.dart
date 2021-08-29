import 'package:flutter/material.dart';
import 'package:kr_app/common/constants.dart';
import 'package:kr_app/logic/get_tabbar_month.dart';
import 'package:kr_app/presentation/bankbook/bankbook_model.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
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
      create: (_) => BankBookModel(),
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
                                                : buildBankList(
                                                    model
                                                        .posts![tabController
                                                            .index][i]
                                                        .postDate
                                                        .toString(),
                                                    model
                                                        .posts![tabController
                                                            .index][i]
                                                        .amount!,
                                                    model
                                                        .posts![tabController
                                                            .index][i]
                                                        .comment!),
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
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BankBookPage extends StatelessWidget {
  List<Tab> tabs = <Tab>[
    Tab(text: 'それ以前'),
    Tab(text: '2021 3月'),
    Tab(text: '2021 4月'),
    Tab(text: '2021 5月'),
    Tab(text: '先月'),
    Tab(text: '今月'),
    Tab(text: '全期間'),
  ];

  TabBar get _tabBar => TabBar(
        isScrollable: true,
        tabs: [
          Tab(text: 'それ以前'),
          Tab(text: '2021 3月'),
          Tab(text: '2021 4月'),
          Tab(text: '2021 5月'),
          Tab(text: '先月'),
          Tab(text: '今月'),
          Tab(text: '全期間'),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 5,
      length: 7,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            print('heoolo');
          }
        });

        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 108,
            backgroundColor: Colors.brown.shade400,
            title: Text('通帳'),
            bottom: PreferredSize(
                preferredSize: _tabBar.preferredSize,
                child: Container(
                  height: 48,
                  color: Colors.brown.shade700.withOpacity(0.2),
                  child: _tabBar,
                )),
          ),
          backgroundColor: Colors.orange.shade50,
          body: TabBarView(
            children: tabs.map((Tab tab) {
              return Center(
                child: Text(
                  '${tab.text!} Tab',
                  style: Theme.of(context).textTheme.headline5,
                ),
              );
            }).toList(),
          ),

          // body: Container(
          //   child: Center(
          //     child: StreamBuilder<QuerySnapshot>(
          //       stream: _postsStream,
          //       builder: (BuildContext context,
          //           AsyncSnapshot<QuerySnapshot> snapshot) {
          //         if (snapshot.hasError) {
          //           return Text('Something went wrong');
          //         }

          //         if (snapshot.connectionState == ConnectionState.waiting) {
          //           return Text("Loading");
          //         }

          //         // return ListView(

          //         //   children:
          //         //       snapshot.data!.docs.map((DocumentSnapshot document) {
          //         //     Map<String, dynamic> data =
          //         //         document.data() as Map<String, dynamic>;
          //         //     return ListTile(

          //         //       title: Center(child: Text(data['date'])),
          //         //       subtitle: Center(child: Text(data['amount'])),
          //         //     );
          //         //   }).toList(),
          //         // );
          //         //                     snapshot.data!.docs.map((DocumentSnapshot document) {
          //         //   Map<String, dynamic> data =
          //         //       document.data() as Map<String, dynamic>;
          //         // }
          //         return Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 0.0),
          //           child: ListView.builder(
          //             scrollDirection: Axis.vertical,
          //             shrinkWrap: true,
          //             physics: BouncingScrollPhysics(),
          //             itemCount: 20,
          //             itemBuilder: (BuildContext context, int index) {
          //               return _buildPlayerModelList('takashi', 'toky');
          //             },
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
        );
      }),
    );
  }

  Widget _buildPlayerModelList(String name, String description) {
    return Card(
      child: ExpansionTile(
        title: Text(
          name,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              description,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}

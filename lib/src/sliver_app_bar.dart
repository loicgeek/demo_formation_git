import 'package:flutter/material.dart';

class SliverAppBarPage extends StatefulWidget {
  const SliverAppBarPage({Key? key}) : super(key: key);

  @override
  _SliverAppBarPageState createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                // stretch: true,
                //   title: Text("Custom scroll view"),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    color: Colors.black,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        width: 50,
                        height: 50,
                      ),
                      Text("Loic"),
                    ],
                  ),
                ),
                expandedHeight: 200,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        width: 50,
                        height: 50,
                      ),
                      title: Text('Hello $index'),
                    );
                  },
                  childCount: 15,
                ),
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 4.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.teal[100 * (index % 9)],
                      child: Text('grid item $index'),
                    );
                  },
                  childCount: 8,
                ),
              ),
              SliverGrid.count(
                crossAxisCount: 2,
                children: [
                  Card(
                    child: Container(
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ListTile(
                      title: Text('Hello $index'),
                    );
                  },
                  childCount: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

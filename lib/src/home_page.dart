import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/calculator.dart';
import 'package:whatsapp_clone/src/calls_list.dart';
import 'package:whatsapp_clone/src/conversations_list.dart';
import 'package:whatsapp_clone/src/statuses_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;

  int counter = 0;

  @override
  void initState() {
    print("initState");
    _tabController = TabController(length: 3, vsync: this);
    _tabController!.addListener(_tabListener);
    super.initState();
  }

  _tabListener() {}

  @override
  void dispose() {
    _tabController?.removeListener(_tabListener);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void reassemble() {
    print("reassemle");
    super.reassemble();
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    print("didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Whatsapp"),
        centerTitle: false,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
        bottom: PreferredSize(
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(
                  text: "Conversations",
                ),
                Tab(
                  text: "Status",
                ),
                Tab(
                  text: "Appels",
                ),
              ],
            ),
            preferredSize: Size.fromHeight(50)),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [ConversationsList(), StatusesList(), CallsList()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;
          setState(() {});
          print(counter);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

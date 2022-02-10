import 'package:flutter/material.dart';

class StatusesList extends StatefulWidget {
  const StatusesList({Key? key}) : super(key: key);

  @override
  _StatusesListState createState() => _StatusesListState();
}

class _StatusesListState extends State<StatusesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.send),
      ),
      body: Container(),
    );
  }
}

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
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  title: Text("Hilare status"),
                  subtitle: Text("${DateTime.now()}"),
                ),
                Divider(
                  height: 1,
                )
              ],
            );
          }),
    );
  }
}

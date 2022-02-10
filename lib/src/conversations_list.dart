import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/widgets/conversation_tile.dart';

class ConversationsList extends StatefulWidget {
  const ConversationsList({Key? key}) : super(key: key);

  @override
  _ConversationsListState createState() => _ConversationsListState();
}

class _ConversationsListState extends State<ConversationsList> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var i = 0; i < 10; i++)
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                for (var i = 0; i < 15; i++) ...[
                  ConversationTile(
                    sender: "Sender $i",
                    lastMessage: "Last message $i",
                    unreadMessageCount: i,
                  ),
                  Divider(
                    height: .5,
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}

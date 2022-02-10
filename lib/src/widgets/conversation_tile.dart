import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/conversation_details.dart';

class ConversationTile extends StatelessWidget {
  final String sender;
  final String lastMessage;
  final int unreadMessageCount;
  const ConversationTile({
    Key? key,
    required this.sender,
    required this.lastMessage,
    this.unreadMessageCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/conversation-details');
      },
      child: Container(
        padding: EdgeInsets.all(5),
        color: Colors.amber,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(sender),
                    Text(lastMessage),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("1:23 PM"),
                Row(
                  children: [
                    Icon(Icons.volume_mute),
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: Text("$unreadMessageCount"),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

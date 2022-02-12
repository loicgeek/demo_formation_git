import 'dart:math';

import 'package:flutter/material.dart';

class ConversationDetails extends StatefulWidget {
  final String sender;
  const ConversationDetails({Key? key, required this.sender}) : super(key: key);

  @override
  _ConversationDetailsState createState() => _ConversationDetailsState();
}

class _ConversationDetailsState extends State<ConversationDetails> {
  late TextEditingController _messageController;
  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.sender}"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      hintText: 'Message',
                      prefixIcon: Icon(
                        Icons.sms_outlined,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Transform.rotate(
                              angle: pi / 4,
                              child: Icon(Icons.attachment),
                            ),
                            Icon(
                              Icons.photo_camera,
                            ),
                          ],
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print(_messageController.text);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.send,
                    color: Colors.white,
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

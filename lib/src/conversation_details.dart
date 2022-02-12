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
  bool _isEditing = false;
  List<Message> _messages = [];
  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    initMessages();
  }

  initMessages() {
    for (var i = 0; i < 10; i++) {
      _messages.add(
        Message(
          i,
          'Bonjour $i, comment tu vas ?',
          DateTime.now().add(
            Duration(minutes: i),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.sender}"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                var message = _messages[index];
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: index % 3 == 0
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * .7),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.deepPurple,
                        ),
                        child: Column(
                          children: [
                            Text(
                              message.message,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      controller: _messageController,
                      minLines: 1,
                      maxLines: 3,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            _isEditing = true;
                          });
                        } else {
                          setState(() {
                            _isEditing = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        hintText: 'Message',
                        prefixIcon: Icon(
                          Icons.sms_outlined,
                        ),
                        suffixIcon: _isEditing
                            ? Padding(
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
                              )
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: GestureDetector(
                    onTap: () {
                      print(_messageController.text);
                      if (_messageController.text.isNotEmpty) {
                        _messages.insert(
                          0,
                          Message(
                            _messages.length,
                            _messageController.text,
                            DateTime.now(),
                          ),
                        );
                        _messageController.clear();
                        setState(() {});
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: Icon(
                        _isEditing ? Icons.send : Icons.mic,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final int id;
  final String message;
  final DateTime date;

  Message(this.id, this.message, this.date);
}

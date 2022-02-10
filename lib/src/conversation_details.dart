import 'package:flutter/material.dart';

class ConversationDetails extends StatefulWidget {
  const ConversationDetails({Key? key}) : super(key: key);

  @override
  _ConversationDetailsState createState() => _ConversationDetailsState();
}

class _ConversationDetailsState extends State<ConversationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("conversation details"),
      ),
    );
  }
}

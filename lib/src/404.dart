import 'package:flutter/material.dart';

class Page404 extends StatefulWidget {
  const Page404({Key? key}) : super(key: key);

  @override
  _Page404State createState() => _Page404State();
}

class _Page404State extends State<Page404> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Page Not found"),
      ),
    );
  }
}

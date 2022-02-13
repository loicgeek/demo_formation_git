import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/widgets/conversation_tile.dart';

class ConversationsList extends StatefulWidget {
  const ConversationsList({Key? key}) : super(key: key);

  @override
  _ConversationsListState createState() => _ConversationsListState();
}

class _ConversationsListState extends State<ConversationsList> {
  late PageController pageController;
  int slideCount = 3;
  double activeSlide = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(_slideListener);

    super.initState();
  }

  _slideListener() {
    setState(() {
      activeSlide = pageController.page!;
    });
  }

  @override
  void dispose() {
    pageController.removeListener(_slideListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 210,
            child: Stack(
              children: [
                PageView(
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          //   shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://img.ev.mu/images/attractions/534/960x640/10421.jpg"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          //   shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://www.camerounsports.info/wp-content/uploads/sites/5/2019/07/67304251_2396703040417538_7548501118318280704_n.png"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          //   shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://www.camerounsports.info/wp-content/uploads/sites/5/2019/07/67304251_2396703040417538_7548501118318280704_n.png"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (activeSlide != 0)
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.4),
                            ),
                            child: IconButton(
                              onPressed: () {
                                pageController.previousPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeOut);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          )
                        else
                          Container(),
                        if (activeSlide != (slideCount - 1))
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.4),
                            ),
                            child: IconButton(
                              onPressed: () {
                                pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeOut);
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ),
                          )
                        else
                          Container(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
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

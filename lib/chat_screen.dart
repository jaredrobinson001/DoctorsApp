import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hairsaloon/utils/avatar_list.dart';
import 'package:hairsaloon/utils/chat_list.dart';
import 'package:unicons/unicons.dart';

import 'constants.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBoxDecoIndigo,
        height: MediaQuery.of(context).size.height * 1.2,
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(
                height: 60.0,
              ),
              CircleAvatarChatRow(),
              SizedBox(
                height: 10.0,
              ),
              ChatRow(),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleAvatarChatRow extends StatelessWidget {
  const CircleAvatarChatRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 15.0),
            child: Column(
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                  child: const Center(
                    child: Icon(
                      UniconsLine.plus,
                      size: 30.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const SizedBox(
                  width: 75.0,
                  child: Align(
                    child: Text(
                      'Your Story',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: List.generate(avatars.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 60.0,
                      height: 60.0,
                      child: Stack(
                        children: [
                          avatars[index].hasStory
                              ? Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.blue.shade600,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Container(
                                    width: 75.0,
                                    height: 75.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          avatars[index].doctorImage,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        avatars[index].doctorImage,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                          avatars[index].isOnline
                              ? Positioned(
                                  top: 40.0,
                                  left: 42.0,
                                  child: Container(
                                    width: 20.0,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade600,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 3.0,
                                      ),
                                    ),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: 75.0,
                      child: Align(
                          child: Text(
                        avatars[index].doctorName,
                        overflow: TextOverflow.ellipsis,
                      )),
                    )
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

class ChatRow extends StatelessWidget {
  const ChatRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(chats.length, (index) {
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
            child: Row(children: [
              SizedBox(
                width: 60.0,
                height: 60.0,
                child: Stack(
                  children: [
                    chats[index].hasStory
                        ? Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.blue.shade600,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                width: 75.0,
                                height: 75.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(chats[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(chats[index].image),
                                  fit: BoxFit.cover),
                            ),
                          ),
                    chats[index].isOnline
                        ? Positioned(
                            top: 40.0,
                            left: 42.0,
                            child: Container(
                              width: 20.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: Colors.green.shade600,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 3.0),
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.78,
                child: ListTile(
                  title: Text(chats[index].doctor),
                  subtitle: Text(chats[index].message),
                  trailing: Text(chats[index].dateTime),
                ),
              )
            ]),
          ),
        );
      }),
    );
  }
}

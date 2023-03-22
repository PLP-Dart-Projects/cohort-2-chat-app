import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final user =
        arguments.containsKey("user") ? arguments["user"] : "Default User";

    return Scaffold(
        appBar: AppBar(
          title: Text(user),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                LeftChatBody(
                  text: "This is a simple Message 1",
                ),
                RighChatBody(
                  text: "This is a simple Message 2",
                ),
                LeftChatBody(
                  text: "This is a simple Message 1",
                ),
                RighChatBody(
                  text: "This is a simple Message 2",
                ),
                LeftChatBody(
                  text: "This is a simple Message 1",
                ),
                RighChatBody(
                  text: "This is a simple Message 2",
                ),
                LeftChatBody(
                  text: "This is a simple Message 1",
                ),
                RighChatBody(
                  text: "This is a simple Message 2",
                ),
                LeftChatBody(
                  text: "This is a simple Message 1",
                ),
                RighChatBody(
                  text: "This is a simple Message 2",
                ),
                LeftChatBody(
                  text: "This is a simple Message 1",
                ),
                RighChatBody(
                  text: "This is a simple Message 2",
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          hintText: 'Your message.',
                        ),
                        maxLines: 1,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class RighChatBody extends StatelessWidget {
  final String text;

  const RighChatBody({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ChatBody(
            text: text,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class LeftChatBody extends StatelessWidget {
  final String text;

  const LeftChatBody({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          ChatBody(
            text: text,
          ),
        ],
      ),
    );
  }
}

class ChatBody extends StatelessWidget {
  final String text;
  final Color color;

  const ChatBody({
    super.key,
    required this.text,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

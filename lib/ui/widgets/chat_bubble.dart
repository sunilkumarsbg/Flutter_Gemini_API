import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../models/chat_message.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      alignment:
          message.sender == 'Me' ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: message.sender == 'Me'
                  ? Theme.of(context).primaryColor.withOpacity(0.2)
                  : Colors.grey[200],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                message.sender != 'Me'
                    ? Lottie.asset('assets/user_profile.json',
                        width: 45, height: 45, fit: BoxFit.fill)

                    // const SizedBox(
                    //         width: 50,
                    //         height: 50,
                    //         child: CircleAvatar(
                    //             radius: 50,
                    //             backgroundImage:
                    //                 AssetImage("assets/images/profile.jpeg")),
                    //       )
                    : Lottie.asset('assets/qus2.json',
                        width: 45, height: 45, fit: BoxFit.fill),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: message.sender != 'Me'
                        ? const EdgeInsets.only(top: 10)
                        : const EdgeInsets.only(top: 10),
                    child: Text(message.message),
                  ),
                ),
              ],
            ),
          ),
          if (message.isLoading) const SizedBox(height: 30),
          if (message.isLoading)
            Row(
              children: [
                const Text("Typing..."),
                const SizedBox(
                  width: 2,
                ),
                Lottie.asset('assets/dot_loader.json',
                    width: 50, height: 50, fit: BoxFit.fill),
              ],
            ),
          if (message.isLoading) const SizedBox(height: 30),
        ],
      ),
    );
  }
}

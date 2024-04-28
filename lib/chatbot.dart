import 'package:find_me/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFFFDF1E1),
      appBar: AppBar(
        title: const ListTile(
          //tkhalik taamil fazet medilinkl doctors fou9 baathhom
          title: Text(
            "Chatbot",
            style: TextStyle(
                color: Color(0xFF8F5622),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.green,
                radius: 3,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "En ligne",
                style: TextStyle(
                  color: Colors.green,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xFFFDF1E1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF8F5622),
          ),
          onPressed: () {
            Navigator.pop(
                context,
                CupertinoPageRoute(
                    builder: ((context) => const MainScreenPage())));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Divider(
              color: Color.fromARGB(255, 220, 197, 167),
              thickness: 0.5,
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              "assets/images/Capture.PNG",
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Fashion and clothes:Zara,Adidas",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 13),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    "Acessories",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "leisure and entertainment",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      "Home equipements",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 11),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      "IT and multimedia:Hp,Dell",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    "Autres",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CupertinoTextField(
                placeholder: "Hi,How can I help you today?",
                placeholderStyle: const TextStyle(
                    fontFamily: 'Poppins', fontSize: 12, color: Colors.grey),
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF8F5622), width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 250, 230, 205),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                prefix: const Icon(Icons.search, color: Color(0xFF8F5622)),
                //suffixInsets: EdgeInsets.only(right: 8.0),
                prefixMode: OverlayVisibilityMode.always,
                suffix:
                    const Icon(Icons.send_rounded, color: Color(0xFF8F5622)),
                //suffixInsets: EdgeInsets.only(right: 8.0),
                suffixMode: OverlayVisibilityMode.always,
              ),
            )
          ],
        )),
      ),
    );
  }
}
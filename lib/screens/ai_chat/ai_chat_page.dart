import 'package:braucoe/providers/ai_chat_provider.dart';
import 'package:braucoe/utilities/images.dart';
import 'package:braucoe/widgets/profile_image_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AIChatPage extends StatefulWidget {
  const AIChatPage({super.key});

  @override
  State<AIChatPage> createState() => _AIChatPageState();
}

class _AIChatPageState extends State<AIChatPage> {
  late TextEditingController textEditingController;
  late Gemini gemini;
  int length = 0;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    gemini = Gemini.instance;
    gemini
        .chat(
      Provider.of<AIChatProvider>(context, listen: false).chat,
      generationConfig: GenerationConfig(
        temperature: 1.0,
      ),
    )
        .then((value) {
      Provider.of<AIChatProvider>(context, listen: false)
          .addMessage(value!.content!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SvgPicture.asset(Images.geminiLogo, height: 40,),
        centerTitle: true,
        backgroundColor: CupertinoColors.systemGrey6,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
        child: Column(
          children: [
            Expanded(
              child: Consumer<AIChatProvider>(
                builder: (BuildContext context, AIChatProvider chatProvider,
                    Widget? child) {
                  print(chatProvider.chat);
                  return ListView.builder(
                    reverse: true,
                    itemCount: chatProvider.chat.length,
                    itemBuilder: (listCTX, index) {
                      int length = chatProvider.chat.length - 1;
                      if (index == length) {
                        return const SizedBox.shrink();
                      }
                      return Align(
                        alignment: chatProvider.chat[length - index].role == 'user' ? Alignment.topRight : Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: chatProvider.chat[length - index].role == 'user' ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                chatProvider.chat[length - index].role == 'user'
                                    ? const Color(0xFFA5DEC5)
                                    : CupertinoColors.lightBackgroundGray,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  chatProvider.chat[length - index].parts!.first.text!,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 15,
                              child: chatProvider.chat[length - index].role == 'user' ? ProfileImageGenerator(radius: 16,) : SvgPicture.asset(Images.gemini),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: length >= 100 ? length >= 200 ? length >= 300 ? 500 : 200 : 150 : 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: textEditingController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(width: 3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Message . . .',
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'LibreFranklin-Regular',
                            ),
                          ),
                          onChanged: (value){
                            setState(() {
                              length = value.length;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: height * 0.065,
                        width: width * 0.14,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00512D),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Consumer<AIChatProvider>(
                          builder: (BuildContext context, AIChatProvider chatProvider,
                              Widget? child) {
                            return InkWell(
                              onTap: () {
                                if (textEditingController.text.isNotEmpty) {
                                  chatProvider.addMessage(
                                    Content(
                                      parts: [
                                        Parts(text: textEditingController.text),
                                      ],
                                      role: 'user',
                                    ),
                                  );
                                  gemini
                                      .chat(
                                    chatProvider.chat,
                                    generationConfig: GenerationConfig(
                                      temperature: 1.0,
                                    ),
                                  )
                                      .then((value) {
                                    chatProvider.addMessage(value!.content!);
                                  });
                                  textEditingController.clear();
                                }
                              },
                              child: const Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 30,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

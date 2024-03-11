import 'dart:io';

import 'package:flutter/material.dart';

import 'package:braucoe/providers/chat_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:braucoe/utilities/file_handling.dart';
import 'package:flutter/foundation.dart' as foundation;

import 'package:braucoe/data/apis/login_api.dart';
import 'package:braucoe/data/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:braucoe/utilities/images.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../utilities/encrypt_data.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key, required this.name, required this.regNo});

  static const String routeName = '/chatRoom';
  final String name;
  final String regNo;

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  bool _showEmoji = false;
  late TextEditingController _textEditingController;
  final ScrollController _scrollController = ScrollController();
  List<int> students = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    students = [LoginAPI.studentDetails?.studentId, int.parse(widget.regNo)];
    _textEditingController = TextEditingController();
  }

  Future<String> _saveFile(File file) async
  {
    final storageRef = FirebaseStorage.instance.ref('chat_files');
    final fileRef = storageRef.child('${getFileName(file.path)}.${getFileExtension(file)}');
    print('FILE REF : ${fileRef.fullPath}');
    UploadTask task = fileRef.putFile(file,);
    return await task.snapshot.ref.fullPath;
  }

  void _saveMessage(Message message, File? file) async {
    if(file != null)
      {
        String path = await _saveFile(file);
        print('NAME : '+FirebaseStorage.instance.ref(path).name);
        message.message = EncryptData.encryptAES(path);
      }
    CollectionReference collectionReference = firebaseFirestore
        .collection('chats')
        .doc(
            '${EncryptData.encryptAES(students[0].toString())}_${EncryptData.encryptAES(students[1].toString())}')
        .collection('messages');
    collectionReference.add({
      'message': message.message?.trim(),
      'timestamp': message.timestamp,
      'senderId': message.senderId,
      'type' : message.type,
      'receiverId': message.receiverId,
    });
  }

  // /data/user/0/com.example.restapiusage/cache/file_picker/in.gov.uidai-ADHAR-8b17cf01c339b37d022b88ffb748f342.jpeg
  String getFileName(String file)
  {
    List<String> subParts = file.split('/').last.split('.');
    String name = '';
    for(int i = 0; i < subParts.length - 1; i++)
      {
        name += subParts[i];
      }
    return name;
  }

  String getFileExtension(File file)
  {
    return file.path.split('/').last.split('.').last;
  }

  void _sendMessage() {
    String? text;
    if (_textEditingController.text.trim().isEmpty && pickedFiles == null) {
      return;
    }
    if (_textEditingController.text.trim().isNotEmpty) {
      text = EncryptData.encryptAES(_textEditingController.text);
    }
    Message message = Message(
      message: text,
      timestamp: DateTime.now(),
      type: text == null ? 'file' : 'text',
      senderId:
          EncryptData.encryptAES(LoginAPI.studentDetails!.studentId.toString()),
      receiverId: EncryptData.encryptAES(int.parse(widget.regNo).toString()),
    );
    _textEditingController.clear();
    if (text != null) {
      _saveMessage(message, null);
      setState(() {
        pickedFiles = [];
      });
      return;
    } else {
      for (File file in pickedFiles!) {
        _saveMessage(message, file);
      }
      setState(() {
        pickedFiles = [];
      });
    }
  }

  void _openEmojiPicker() {
    setState(() {
      _showEmoji = !_showEmoji;
    });
  }

  List<File>? pickedFiles = [];

  Stream<List<Map<String, dynamic>>> _messagesStream() {
    return firebaseFirestore
        .collection('chats')
        .doc(
            '${EncryptData.encryptAES(students[0].toString())}_${EncryptData.encryptAES(students[1].toString())}')
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((event) {
      return event.docs.map((e) {
        return e.data();
      }).toList();
    });
  }

  void _pickFile() async {
    List<File>? files = await FileHandling.pickFile();
    pickedFiles = [...?pickedFiles, if(files != null) ...files];
    print('file path :${pickedFiles![0].path}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    students.sort();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00512D),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const CircleAvatar(
              radius: 20,
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * 0.7,
                  child: Text(
                    widget.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: 'LibreFranklin-Regular',
                    ),
                  ),
                ),
                Text(
                  widget.regNo,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontFamily: 'LibreFranklin-Regular',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Images.chatRoomBackground,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 20,
                width: width * 0.65,
                decoration: BoxDecoration(
                    color: const Color(
                      0xFFCF9F69,
                    ).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                child: const Row(
                  children: [
                    SizedBox(
                      width: 3,
                    ),
                    Icon(
                      Icons.lock,
                      size: 14,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text('Messages are end-to-end encrypted', overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: _messagesStream(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Text(
                        'Loading Messages',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'LibreFranklin-Regular',
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        'Error occurred',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'LibreFranklin-Regular',
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text(
                          'Start chat...',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'LibreFranklin-Regular',
                          ),
                        ),
                      );
                    }
                  }
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: snapshot.data?.length,
                    reverse: true,
                    itemBuilder: (ctx, index) {
                      int? length = (snapshot.data!.length - 1);
                      DateTime date = DateTime.fromMillisecondsSinceEpoch(
                          (snapshot.data![length - index]['timestamp']
                                      as Timestamp)
                                  .seconds *
                              1000);
                      bool isTextMessage = snapshot
                              .data?[length - index]['type'] ==
                          'text';
                      final message = EncryptData.decryptAES(
                              snapshot.data?[length - index]['message']);
                      print(message);
                      int senderId = int.parse(EncryptData.decryptAES(
                          snapshot.data?[length - index]['senderId']));
                      return Align(
                        alignment:
                            senderId == LoginAPI.studentDetails?.studentId
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:
                                senderId == LoginAPI.studentDetails?.studentId
                                    ? const Color(0xFFA5DEC5)
                                    : Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.end,
                              alignment: WrapAlignment.end,
                              children: [
                                isTextMessage
                                    ? Text(
                                        message,
                                        softWrap: true,
                                        maxLines: 30,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontFamily: 'LibreFranklin-Regular',
                                        ),
                                      )
                                    : SizedBox(
                                  width: senderId ==
                                      LoginAPI
                                          .studentDetails?.studentId ? 100 : 160,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.file_copy,
                                            ),
                                            Expanded(
                                              child: Text(
                                                getFileName(message),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            if (!(senderId ==
                                                LoginAPI
                                                    .studentDetails?.studentId))
                                              InkWell(
                                                onTap: () {
                                                  FileHandling.saveFileFromChat(message);
                                                },
                                                 child : Container(
                                                   child: const Icon(
                                                    Icons.file_download_sharp,
                                                                                                   ),
                                                 ),
                                              )
                                          ],
                                        ),
                                      ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  DateFormat.jm().format(date),
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.black.withOpacity(0.5),
                                    fontFamily: 'LibreFranklin-Regular',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      if (pickedFiles != null)
                        if (pickedFiles!.isNotEmpty)
                          for (int i = 0; i < pickedFiles!.length; i++)
                            Container(
                              height: 50,
                              width: 170,
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      Icons.file_copy,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                      getFileName(pickedFiles![i].path),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        pickedFiles!.removeAt(i);
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.cancel_rounded,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: width * 0.8,
                      child: Consumer<ChatProvider>(
                        builder: (context, chatProvider, child) {
                          return TextField(
                            controller: _textEditingController,
                            keyboardType: TextInputType.multiline,
                            readOnly:
                                pickedFiles != null && pickedFiles!.isNotEmpty,
                            maxLines: null,
                            autocorrect: true,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                chatProvider.changeTextTypeState(true);
                              } else {
                                chatProvider.changeTextTypeState(false);
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Message',
                              hintStyle: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFF657782),
                                fontFamily: 'LibreFranklin-Regular',
                              ),
                              prefixIcon: IconButton(
                                icon: const Icon(
                                  Icons.emoji_emotions_outlined,
                                  size: 25,
                                ),
                                color: const Color(
                                  0xFF657782,
                                ),
                                onPressed: _openEmojiPicker,
                              ),
                              suffixIcon: chatProvider.isTextType
                                  ? null
                                  : InkWell(
                                      onTap: _pickFile,
                                      child: const Icon(
                                        Icons.file_present,
                                        size: 25,
                                        color: Color(
                                          0xFF657782,
                                        ),
                                      ),
                                    ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: height * 0.065,
                      width: width * 0.14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xFF00512D),
                      ),
                      child: InkWell(
                        onTap: _sendMessage,
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: _showEmoji,
              child: EmojiPicker(
                textEditingController: _textEditingController,
                scrollController: _scrollController,
                config: Config(
                  height: 256,
                  checkPlatformCompatibility: true,
                  emojiViewConfig: EmojiViewConfig(
                    emojiSizeMax: 28 *
                        (foundation.defaultTargetPlatform == TargetPlatform.iOS
                            ? 1.2
                            : 1.0),
                  ),
                  swapCategoryAndBottomBar: false,
                  skinToneConfig: const SkinToneConfig(),
                  categoryViewConfig: const CategoryViewConfig(),
                  bottomActionBarConfig: const BottomActionBarConfig(),
                  searchViewConfig: const SearchViewConfig(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

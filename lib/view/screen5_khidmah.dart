import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khidmah/viewmode/khidmah_viewmodel.dart';
import 'package:provider/provider.dart';

class Screen5Khidmah extends StatefulWidget {
  const Screen5Khidmah({super.key});

  @override
  State<Screen5Khidmah> createState() => _Screen5KhidmahState();
}

class _Screen5KhidmahState extends State<Screen5Khidmah> {
  TextEditingController saveController = TextEditingController();
  var msg;
  String? isMessageSelectedID;
  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<KhidmahViewmodel>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: isMessageSelectedID != null
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    isMessageSelectedID = null;
                  });
                },
                icon: Icon(Icons.close),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Do you want to delete?'),
                          actions: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancle'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    viewmodel.deleteMessage(
                                      isMessageSelectedID!,
                                    );
                                    setState(() {
                                      isMessageSelectedID = null;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text('Delete'),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.delete_outline),
                ),
              ],
            )
          : AppBar(
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Icon(Icons.circle, size: 60, color: Colors.teal),
                  Text('Awais'),
                ],
              ),
            ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chats')
                  .doc('booking1')
                  .collection('messages')
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                var docs = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    var saveIndex = docs[index];
                    return Align(
                      alignment: saveIndex['sender'] == 'coustmer'
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 10),
                        child: GestureDetector(
                          onLongPress: () {
                            HapticFeedback.mediumImpact;
                            setState(() {
                              isMessageSelectedID = saveIndex.id;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: saveIndex['sender'] == 'coustmer'
                                  ? const Color.fromARGB(255, 87, 233, 218)
                                  : Colors.grey,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Text(saveIndex['text']),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),

            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: saveController,
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    onPressed: () {
                      if (saveController.text.trim().isEmpty) {
                        return;
                      }
                      viewmodel.sendMessage(saveController.text);
                      saveController.clear();
                    },
                    icon: Icon(Icons.send, color: Colors.teal),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

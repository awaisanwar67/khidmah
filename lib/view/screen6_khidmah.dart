import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khidmah/view/khidma_view.dart';

class Screen6Khidmah extends StatefulWidget {
  const Screen6Khidmah({super.key});

  @override
  State<Screen6Khidmah> createState() => _Screen6KhidmahState();
}

class _Screen6KhidmahState extends State<Screen6Khidmah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Do you want to Signout'),
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
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => KhidmaView(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Text('Signout'),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
        child: Center(child: Text('Sign out')),
      ),
    );
  }
}

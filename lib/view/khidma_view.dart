import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khidmah/view/screen2_khidmahview.dart';
import 'package:khidmah/viewmode/khidmah_viewmodel.dart';
import 'package:provider/provider.dart';

class KhidmaView extends StatefulWidget {
  const KhidmaView({super.key});

  @override
  State<KhidmaView> createState() => _KhidmaViewState();
}

class _KhidmaViewState extends State<KhidmaView> {
  FocusNode focus1 = FocusNode();
  FocusNode focus2 = FocusNode();
  FocusNode focus3 = FocusNode();
  FocusNode focus4 = FocusNode();
  FocusNode focus5 = FocusNode();
  FocusNode focus6 = FocusNode();
  TextEditingController numberController = TextEditingController();
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();
  String verificationId = '';
  KhidmahViewmodel khidmahViewmodel = KhidmahViewmodel();

  @override
  Widget build(BuildContext context) {
    final khidmah = context.read<KhidmahViewmodel>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text('Sign in with your phone number to continue'),
              SizedBox(height: 40),
              Text(
                'Mobile Number',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        spreadRadius: 2,
                        offset: Offset(0, 2),
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: numberController,
                    decoration: InputDecoration(
                      hintText: 'Enter number',

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'OTP will be sent via SMS',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: TextFormField(
                      focusNode: focus1,
                      textAlign: TextAlign.center,
                      obscureText: true,
                      obscuringCharacter: '*',
                      controller: otp1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.zero,
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).requestFocus(focus2);
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: TextFormField(
                      focusNode: focus2,
                      textAlign: TextAlign.center,
                      obscureText: true,
                      obscuringCharacter: '*',
                      controller: otp2,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.zero,
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).requestFocus(focus3);
                        }
                        if (value.isEmpty) {
                          FocusScope.of(context).requestFocus(focus1);
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: TextFormField(
                      focusNode: focus3,
                      textAlign: TextAlign.center,
                      obscureText: true,
                      obscuringCharacter: '*',
                      controller: otp3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.zero,
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).requestFocus(focus4);
                        }
                        if (value.isEmpty) {
                          FocusScope.of(context).requestFocus(focus2);
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: TextFormField(
                      focusNode: focus4,
                      textAlign: TextAlign.center,
                      obscureText: true,
                      obscuringCharacter: '*',
                      controller: otp4,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.zero,
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).requestFocus(focus5);
                        }
                        if (value.isEmpty) {
                          FocusScope.of(context).requestFocus(focus3);
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: TextFormField(
                      focusNode: focus5,
                      textAlign: TextAlign.center,
                      obscureText: true,
                      obscuringCharacter: '*',
                      controller: otp5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.zero,
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).requestFocus(focus6);
                        }
                        if (value.isEmpty) {
                          FocusScope.of(context).requestFocus(focus4);
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: TextFormField(
                      focusNode: focus6,
                      textAlign: TextAlign.center,
                      obscureText: true,
                      obscuringCharacter: '*',
                      controller: otp6,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.zero,
                      ),
                      onChanged: (value) async {
                        if (value.length == 1) {
                          String smsCode =
                              otp1.text +
                              otp2.text +
                              otp3.text +
                              otp4.text +
                              otp5.text +
                              otp6.text;
                          khidmahViewmodel.verifyOTP(smsCode, verificationId);
                          bool success = await khidmahViewmodel.verifyOTP(
                            smsCode,
                            verificationId,
                          );
                          if (success == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Screen2Khidmahview(),
                              ),
                            );
                          }
                        }
                        if (value.isEmpty) {
                          FocusScope.of(context).requestFocus(focus5);
                        }
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: numberController.text,
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String id, int? resendToken) {
                      verificationId = id;
                    },
                    codeAutoRetrievalTimeout: (String id) {},
                  );
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade700,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Center(
                    child: Text(
                      'Send OTP',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text('------------  or continue with  ------------'),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  bool success = await khidmah.signinWithGoogle();
                  if (success == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Screen2Khidmahview(),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        spreadRadius: 2,
                        color: Colors.black12,
                      ),
                    ],
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Row(
                      children: [
                        Image.asset('assets/google.png', height: 40, width: 40),
                        Text(
                          'Google',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 150),
              Row(
                children: [
                  SizedBox(width: 75),
                  Text('New here?'),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Create account',
                      style: TextStyle(
                        color: Colors.teal.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:khidmah/firebase_options.dart';
import 'package:khidmah/view/khidma_view.dart';
import 'package:khidmah/view/screen2_khidmahview.dart';
import 'package:khidmah/viewmode/khidmah_viewmodel.dart';
import 'package:provider/provider.dart';

Widget MyApp() {
  return MaterialApp(
    home: FirebaseAuth.instance.currentUser == null
        ? KhidmaView()
        : Screen2Khidmahview(),
    debugShowCheckedModeBanner: false,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => KhidmahViewmodel(),
      child: MyApp(),
    ),
  );
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:latlong2/latlong.dart';

class KhidmahViewmodel extends ChangeNotifier {
  LatLng? locationSaver;
  String? addres;
  DateTime? timeDate;
  Future<bool> verifyOTP(String smsCode, String verificationId) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (e) {
      return false;
    }
  }

  void saveLoc(LatLng point) async {
    locationSaver = point;
    notifyListeners();
    List<Placemark> placemarks = await placemarkFromCoordinates(
      point.latitude,
      point.longitude,
    );
    Placemark place = placemarks[0];
    addres = "${place.street},${place.locality}";
    notifyListeners();
  }

  void saveDateTime(DateTime date, TimeOfDay time) {
    timeDate = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    notifyListeners();
  }

  void sendMessage(String text) async {
    await FirebaseFirestore.instance
        .collection('chats')
        .doc('booking1')
        .collection('messages')
        .add({
          'text': text,
          'sender': 'coustmer',
          'timestamp': FieldValue.serverTimestamp(),
        });
  }

  Future<bool> signinWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    GoogleSignInAccount? Googleuser = await googleSignIn.signIn();
    if (Googleuser == null) {
      return false;
    }
    GoogleSignInAuthentication googleAuth = await Googleuser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    return true;
  }

  void deleteMessage(String messageid) {
    FirebaseFirestore.instance
        .collection('chats')
        .doc('booking1')
        .collection('messages')
        .doc(messageid)
        .delete();
  }
}

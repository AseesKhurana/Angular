import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_training/model/users.dart';

class Util {
  static AppUser? appUser;

  static Future<bool> isInternetConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }

  static fetchUserDetails() async {
    String uid = await FirebaseAuth.instance.currentUser!.uid.toString();
    if (uid != null) {
      DocumentSnapshot document =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      Util.appUser = AppUser();

      Util.appUser!.uid = document.get('uid').toString();
      Util.appUser!.name = document.get('name').toString();
      Util.appUser!.email = document.get('email').toString();
      Util.appUser!.imageUrl = document.get('imageUrl').toString();
    }
  }

}

class Locale {
  static populateMap() {
    englishLocaleMap['appTitle'] = 'Foodie';
    englishLocaleMap['submit'] = 'Submit';

    hindiLocaleMap['appTitle'] = 'खाने का शौकीन';
    hindiLocaleMap['register'] = 'रजिस्टर करें';
  }

  static Map<String, String> englishLocaleMap = new Map<String, String>();
  static Map<String, String> hindiLocaleMap = new Map<String, String>();

  static int localeType = 2;
  static Map<String, String> locale = hindiLocaleMap;
}

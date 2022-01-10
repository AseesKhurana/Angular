import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_training/pages/cart_page.dart';
import 'package:flutter_training/pages/home-page.dart';
import 'package:flutter_training/pages/payment-methods-page.dart';
import 'package:flutter_training/pages/restaurants-page.dart';
import 'package:flutter_training/pages/splash-page.dart';
import 'package:flutter_training/tutorials/google_maps.dart';
import 'package:flutter_training/tutorials/location-fetch.dart';
import 'pages/LoginPage.dart';
import 'pages/RegisterPage.dart';
import 'package:flutter_training/constants/util.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
AndroidNotificationChannel? channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

// main function represents main thread
// whatever we code in main, is executed by main thread
// that too in a sequence
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  Locale.populateMap();

  // to execute the app created by us
  // MyApp -> Object
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        // Navigator.pushNamed(context, '/message',
        //     arguments: MessageArguments(message, true));
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {

      RemoteNotification? notification = message!.notification;
      AndroidNotification? android = message.notification!.android;

      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel!.id,
                channel!.name,
                channel!.description,
                playSound: true,
                //sound: AndroidNotificationSound()
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      // Navigator.pushNamed(context, '/message',
      //     arguments: MessageArguments(message, true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => SplashPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterUserPage(),
        "/restaurant": (context) => RestaurantsPage(),
        "/location-tutorial": (context) => FetchCurrentLocationPage(),
        "/cart": (context) => CartPage(),
        "/google-maps": (context) => GoogleMapsPage(),
        "/payment": (context) => PaymentMethodsPage(),
      },
      initialRoute: "/",
    );
  }
}

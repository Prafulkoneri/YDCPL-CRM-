import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_messaging_platform_interface/firebase_messaging_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ydcpl_application/internet.dart';
import 'package:ydcpl_application/network/firbase_api.dart';
import 'package:ydcpl_application/screens/Profile/controller/profile_controller.dart';
import 'package:ydcpl_application/screens/auth/controller/auth_controller.dart';
import 'package:ydcpl_application/screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:ydcpl_application/screens/coc/controller/coc_controller.dart';
import 'package:ydcpl_application/screens/home/controller/home_controller.dart';
import 'package:ydcpl_application/screens/home/controller/home_filtter_controller.dart';
import 'package:ydcpl_application/screens/home_view_details/controller/view_details_controller.dart';
import 'package:ydcpl_application/screens/report/controller/report_controller.dart';
import 'package:ydcpl_application/screens/script/controller/screpit_controller.dart';
import 'package:ydcpl_application/screens/setting/controller/setting_controller.dart';
import 'package:ydcpl_application/screens/splashScreen/view/splash_view.dart';
import 'package:ydcpl_application/screens/update_satus/controller/update_status_controller.dart';
import 'package:ydcpl_application/test_connection.dart';
import 'package:ydcpl_application/widgets/loading_overlay.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("handled background message");
}

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
String? selectedNotificationPayload;

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("common baby");
}

Future<void> initNotification(context) async {
  print("helloo init notification");
  // showNotificationWithImage();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('mipmap/launcher_icon');
  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings();
  final MacOSInitializationSettings initializationSettingsMacOS =
      MacOSInitializationSettings();
  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: initializationSettingsMacOS);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) {
    print(payload);
    print("hello allllllll");
  });
}

Future<void> showNotificationWithImage() async {
  final bigPictureStyleInformation = BigPictureStyleInformation(
    FilePathAndroidBitmap('your_image_path'),
    contentTitle: 'Notification with Image',
    summaryText: 'This is an example of a notification with an image.',
  );
}

void main() async {
  print("lets go");
  print("void main");
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isIOS) {
    await Firebase.initializeApp(
        // options: const FirebaseOptions(
        //     apiKey: "AIzaSyBaOZbarFqV16r_fceIjrSAlNtgvddAFgg",
        //     appId: "1:110985117622:ios:1a970d32e1e8e861868b17",
        //     messagingSenderId: "110985117622",
        //     projectId: "lsm-0001")
        );
  } else {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  await FireBaseApi().initNotification();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/launcher_icon');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainScreenController()),
        ChangeNotifierProvider(create: (_) => CocViewController()),
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => ProfileController()),
        ChangeNotifierProvider(create: (_) => ChangeSettingController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => HomeDetailsController()),
        ChangeNotifierProvider(create: (_) => UpdateController()),
        ChangeNotifierProvider(create: (_) => ReportViewController()),
        ChangeNotifierProvider(create: (_) => ScriptController()),
        ChangeNotifierProvider(create: (_) => ConnectivityService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

var fcmToken;

final firebaseMessaging = FirebaseMessaging.instance;

class _MyAppState extends State<MyApp> {
  @override
  @override
  void initState() {
    // FirebaseCrashlytics.instance.crash();
    initNotification(context);
    showNotificationWithImage();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      print("yes this is done and lets rock");
      print(message?.data);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print("void main");
      print(message.data);
      print("onMessageOpenedApp: $message");
      print("okkkkk");
      print(message.data["notification_type"]);
    });

    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      /////////////////////////////////////
    });

    // fireBaseApi();
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Container(
              alignment: Alignment.center,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: LoadingOverlay(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus &&
                          currentFocus.focusedChild != null) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      }
                    },
                    child: MaterialApp(
                      builder: (context, child) {
                        return MediaQuery(
                          data: MediaQuery.of(context)
                              .copyWith(textScaleFactor: 0.81.sp),
                          child: child!,
                        );
                      },
                      title: 'YDCPL',
                      theme: ThemeData(
                        primarySwatch: Colors.blue,
                        fontFamily: 'dm_sans_regular',
                      ),
                      debugShowCheckedModeBanner: false,
                      home: SplashScreen(),
                      // initialRoute: '/',
                      //   routes: {
                      //       '/':(context)=>SplashScreen(),

                      //   },
                    ),
                  ),
                ),
              ));
        }
        // )
        );
  }
}

// 

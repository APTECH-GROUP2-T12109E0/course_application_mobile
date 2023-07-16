
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'common/routes/bloc_observer.dart';
import 'common/service/storage_service.dart';
// import 'package:firebase_core/firebase_core.dart';

class Global{
  static late StorageService storageService;
  static Future init() async{
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = MyGlobalObserver();
    // await Firebase.initializeApp(
    //   // options: DefaultFirebaseOptions.currentPlatform,
    //   options: const FirebaseOptions(
    //   apiKey: "AIzaSyAS1BRFj6AiimW5toYa2a8Omg6IpcVl0VY",
    //   appId: "1:644627120393:android:6d267a043e6474b29a13d8",
    //   messagingSenderId: "644627120393",
    //   projectId: "course-90d87",
    // ),);
    storageService = await StorageService().init();

  }
}
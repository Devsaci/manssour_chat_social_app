// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manssour_chat_social_app/modules/social_register/social_register_screen.dart';
import 'package:manssour_chat_social_app/shared/bloc_observer.dart';
import 'package:manssour_chat_social_app/shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';


void main() {
  BlocOverrides.runZoned(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      DioHelper.init();
      await CacheHelper.init();
      // Widget widget;
      // String? token = CacheHelper.getData(key: 'token');
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Widget?  startWidget;

  MyApp({Key? key, this.startWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: SocialRegisterScreen(),
      // home: NewsLayout(),
    );

  }
}

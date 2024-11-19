import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:government_service_app/screens/home_screen/provider/home_provider.dart';
import 'package:government_service_app/screens/home_screen/views/home_page.dart';
import 'package:government_service_app/screens/web_view_page/views/web_view.dart';
import 'package:government_service_app/utils/helper/shr_helper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool? isTheme = false;
  // @override
  // void initState() {
  //   ShrHelper helps = ShrHelper();
  //   helps.getTheme().then(
  //     (value) {
  //       isTheme = value;
  //       log('$isTheme');
  //     },
  //   );
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeProvider()..getThemes(),
        ),
      ],
      child: Consumer<HomeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData.dark(),
            themeMode: value.isTheme ? ThemeMode.dark : ThemeMode.light,
            // : ThemeMode.light,
            routes: {
              '/': (context) => HomePage(),
              '/web_view': (context) => WebView(),
            },
          );
        },
      ),
    );
  }
}

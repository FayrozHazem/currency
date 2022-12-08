import 'package:fayrouz_currency/view/screens/coin/home_screen.dart';
import 'package:fayrouz_currency/view/screens/coin/splash_screen.dart';
import 'package:fayrouz_currency/view_model/provider/auth/auth_provider.dart';
import 'package:fayrouz_currency/view_model/provider/auth/photo_provider.dart';
import 'package:fayrouz_currency/view_model/provider/coin/home_provider.dart';
import 'package:fayrouz_currency/view_model/provider/coin/profile_provider.dart';
import 'package:fayrouz_currency/view_model/provider/theme_proider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../core/themes.dart';
import '../view_model/provider/coin/details_provider.dart';
import '../view_model/provider/coin/search_provider.dart';
import 'network/coin_api.dart';

Future<void> main()  async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();


  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    ChangeNotifierProvider(create: (_) => ProfileProvider()),
    ChangeNotifierProvider(create: (_) => SearchProvider()),
    ChangeNotifierProvider(create: (_) => DetailsProvider()),
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => ProfileProvider()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => PhotoProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context, listen: false)
        .getThemeModeFromSharedPref();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // dark theme data for crypto currency
      theme: Themes.lightTheme,

      darkTheme: Themes.darkTheme,

      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      home: Splash(),
    );
  }
}

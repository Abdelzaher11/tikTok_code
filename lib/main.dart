import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:tiktok_code/Auth/Login/UI/login_page.dart';
import 'package:tiktok_code/Locale/locale.dart';
import 'package:tiktok_code/Routes/routes.dart';
import 'package:tiktok_code/Theme/style.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(Phoenix(child: Qvid()));
}

class Qvid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('ar'),
        const Locale('id'),
        const Locale('fr'),
        const Locale('pt'),
        const Locale('es'),
      ],
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: LoginPage(),
      routes: PageRoutes().routes(),
    );
  }
}
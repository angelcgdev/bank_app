import 'package:bank_app/pages/home.dart';
import 'package:bank_app/provider/card_selected.dart';
import 'package:bank_app/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> CardSelected()),
        ],
        child: MaterialApp(
          title: 'Bank App',
          theme: MyThemes(context).defaultTheme,
          home: const HomePage(),
        ),
      ),
    );
  }
}

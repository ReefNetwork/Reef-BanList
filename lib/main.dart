import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reef_bans/screens/ban_list.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent));
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData theme =
        ThemeData(useMaterial3: true, colorSchemeSeed: Color(0xff6750a4));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Reef BanList",
      theme: theme,
      home: BanList(),
    );
  }
}

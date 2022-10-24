import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:ex_app/Screens/taken_picture_screen.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();

  final first = cameras.first;

  runApp(SqliteApp(
    firstCamera: first,
  ));
}

class SqliteApp extends StatelessWidget {
  final CameraDescription firstCamera;

  const SqliteApp({Key? key, required this.firstCamera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SQLite Example',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomeScreen(
              firstCamera: firstCamera,
            )
      },
      theme: ThemeData.light()
          .copyWith(appBarTheme: const AppBarTheme(color: Color(0xFF38004D))),
    );
  }
}

import 'package:driveease_v1/Pages/loading_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      home:
          const LoadingPage(), //temporariamente manter em LayoutPage até que o Login esteja funcional
      theme: ThemeData(
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

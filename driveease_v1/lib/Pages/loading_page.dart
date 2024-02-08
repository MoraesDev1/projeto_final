import 'package:driveease_v1/Database/conexao_db.dart';
import 'package:driveease_v1/Database/database.dart';
import 'package:driveease_v1/Pages/layout_page.dart';
import 'package:driveease_v1/Utils/colors_utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    LocalDatabase.initDatabase('driveease_v1.db')
        .then((value) => ConexaoDb().db = value);
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LayoutPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.corFundo,
      body: Center(
        child: Container(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

import 'package:driveease_v1/Utils/colors_utils.dart';
import 'package:driveease_v1/Widgets/Section/goals_section.dart';
import 'package:driveease_v1/Widgets/Section/summary_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UtilsColors.corFundo,
      appBar: AppBar(
        title: const Text('Homepage'),
        centerTitle: true,
        backgroundColor: UtilsColors.verdePrimario,
      ),
      body: SingleChildScrollView(
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SummarySection(),
              SizedBox(height: 10),
              GoalsSection()
            ],
          ),
        ),
      ),
    );
  }
}

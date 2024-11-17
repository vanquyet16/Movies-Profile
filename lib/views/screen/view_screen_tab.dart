import 'package:flutter/material.dart';
import 'package:movies_profile/widgets/bottom_bar.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

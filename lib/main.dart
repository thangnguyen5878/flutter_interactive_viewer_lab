import 'package:flutter/material.dart';
import 'package:flutter_interactive_viewer_lab/pages/page3.dart';
import 'package:flutter_interactive_viewer_lab/pages/page_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: InteractiveViewerScreen(),
    );
  }
}

class InteractiveViewerScreen extends StatelessWidget {
  const InteractiveViewerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Page3(
          viewerSize: 50000,
          screenHeight: MediaQuery.of(context).size.height,
          screenWidth: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
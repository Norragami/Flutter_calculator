import 'dart:io';
import 'package:calculator/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

 main() async {
  WidgetsFlutterBinding.ensureInitialized();
    if (Platform.isWindows) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      
      minimumSize: Size(500, 710),
      size: Size(500, 710),
      maximumSize: Size(500, 710),
      center: true,
      backgroundColor: Colors.transparent,
      // skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
      title: 'Калькулятор',
      windowButtonVisibility: false,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      await windowManager.setMaximizable(false);
    });
  }
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Калькулятор',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const  CalculatorScreen(),
    );
  }
}

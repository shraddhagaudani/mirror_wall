import 'package:flutter/material.dart';
import 'package:mirror_wall/controllers/providers/app_provider.dart';
import 'package:mirror_wall/models/app-model.dart';
import 'package:mirror_wall/views/screens/webview_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RadioButtonAccessProvider(
          ),
        ),
      ],
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const Webview_page(),
          },
        );
      },
    ),
  );
}

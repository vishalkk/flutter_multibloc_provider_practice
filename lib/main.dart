import 'package:flutter/material.dart';

import 'view/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter MultiBlocProvider app',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    debugShowCheckedModeBanner: false,
    home: const MyHomePage(),
  ));
}

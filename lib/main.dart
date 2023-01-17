import 'package:flutter/material.dart';
import 'package:razorpay_integration/payment_screen.dart';

import 'Dashboard /Dashoboard.dart';
import 'Payment Using Api Call/payment_using_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Razer Pay Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Payment Using Api Call/payment_using_api.dart';
import '../payment_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoButton(
                    color: Colors.white,
                    child: Text("Pay Without Api Call",style: TextStyle(color: Colors.black),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentScreen()),
                      );
                    }
                ),
                SizedBox(height: 100,),
                CupertinoButton(
                    color: Colors.white,
                    child: Text("Pay With Api Call",style: TextStyle(color: Colors.black),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentUsingApi()),
                      );
                    }
                )
              ],
            ),
          ),
        )
    );
  }
}

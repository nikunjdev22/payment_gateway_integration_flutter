import 'package:flutter/material.dart';

class PaymentSucessfully extends StatefulWidget {
  const PaymentSucessfully({Key? key}) : super(key: key);

  @override
  State<PaymentSucessfully> createState() => _PaymentSucessfullyState();
}

class _PaymentSucessfullyState extends State<PaymentSucessfully> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.verified_sharp,size: 200,color: Colors.white,),
            Text("Payment Successfully",style: TextStyle(fontSize: 30,color: Colors.white),),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PaymentFailed extends StatefulWidget {
  const PaymentFailed({Key? key}) : super(key: key);

  @override
  State<PaymentFailed> createState() => _PaymentFailedState();
}

class _PaymentFailedState extends State<PaymentFailed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.info_sharp,size: 200,color: Colors.white,),
            Text("Payment Failed",style: TextStyle(fontSize: 30,color: Colors.white),),
          ],
        ),
      ),
    );
  }
}

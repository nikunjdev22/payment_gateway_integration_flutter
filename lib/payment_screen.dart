import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:razorpay_integration/payment_status_failed.dart';
import 'package:razorpay_integration/payment_status_sucessfully.dart';

import 'common_snackBar.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController totalAmount = new TextEditingController();
  var _razorpay = Razorpay();

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "Payment Successfully",backgroundColor: Colors.black,textColor: Colors.white);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PaymentSucessfully()),
    );
    print("Payment successful");
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment failed",backgroundColor: Colors.black,textColor: Colors.white);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PaymentFailed()),
    );
    print("Payment failed");
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: " Payment Successfully",backgroundColor: Colors.black,textColor: Colors.white);
    print("External wallet detected");
    // Do something when an external wallet is selected
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Text("Pay Without Api Call"),
          ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 145,
              height: 48,
              child: TextFormField(
                controller: totalAmount,
                textAlign: TextAlign.center,
                cursorColor: Colors.white,
                onChanged: (va){
                  setState(() {
                  });
                },
                decoration: InputDecoration(
                  hintText: '0',
                  hintStyle: TextStyle(color: Colors.white,fontSize: 33,fontWeight: FontWeight.bold),
                  contentPadding: EdgeInsets.only(left: 20,right: 20),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white,fontSize: 33,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100,),
            CupertinoButton(
                color: Colors.white,
                child: Text("Pay Now",style: TextStyle(color: Colors.black),),
                onPressed: () {
                  var options = {
                    'key': 'rzp_test_xvlZZBGCo0SzL0',
                    'amount': (int.parse(totalAmount.text)*100).toString(), //in the smallest currency sub-unit.
                    'name': 'Nikunj Chitroda',
                    'description': 'Test',
                    'timeout': 300, // in seconds
                    'prefill': {
                      'contact': '9123456789',
                      'email': 'gaurav.kumar@example.com'
                    }
                  };

                  _razorpay.open(options);
                  }
                )
            ],
          ),
      ),
      )
    );
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    // TODO: implement dispose
    super.dispose();
  }
}

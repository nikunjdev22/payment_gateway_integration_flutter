import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:razorpay_integration/Payment%20Using%20Api%20Call/razorpay_response_model.dart';
import 'package:http/http.dart' as http;


class PaymentUsingApi extends StatefulWidget {
  const PaymentUsingApi({Key? key}) : super(key: key);

  @override
  State<PaymentUsingApi> createState() => _PaymentUsingApiState();
}

class _PaymentUsingApiState extends State<PaymentUsingApi> {
  TextEditingController totalAmount = new TextEditingController();
  Razorpay? _razorpay;

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }


  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Fluttertoast.showToast(msg: " Payment Successfully");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "Payment Successfully");
  }

  Future<dynamic> createOrder() async {
    var mapHeader = <String, String>{};
    mapHeader['Authorization'] =
    "Basic cnpwX3Rlc3RfU2RHQmFoV3RsS1dNd2I6Mlh2WElOSDlMcG9xTHdyU3F5cDFzam5y";
    mapHeader['Accept'] = "application/json";
    mapHeader['Content-Type'] = "application/x-www-form-urlencoded";
    var map = <String, String>{};
    setState(() {
      map['amount'] = "${(num.parse(totalAmount.text) * 100)}";
    });
    map['currency'] = "INR";
    map['receipt'] = "receipt1";
    print("map $map");
    var response = await http.post(Uri.https("api.razorpay.com", "/v1/orders"),
        headers: mapHeader, body: map);
    print("...." + response.body);
    if (response.statusCode == 200) {
      RazorpayOrderResponse data =
      RazorpayOrderResponse.fromJson(json.decode(response.body));
      openCheckout(data);
    } else {
      Fluttertoast.showToast(msg: "Something went wrong!");
    }
  }

  void openCheckout(RazorpayOrderResponse data) async {
    var options = {
      'key': 'rzp_test_xvlZZBGCo0SzL0',
      'amount': "${(num.parse(totalAmount.text) * 100)}",
      'name': 'Razorpay Test',
      'description': 'erwe',
      'order_id': '${data.id}',
    };

    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Text("Pay With Api Call"),
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
                    onPressed: () => createOrder(),
                )
              ],
            ),
          ),
        )
    );
  }
}

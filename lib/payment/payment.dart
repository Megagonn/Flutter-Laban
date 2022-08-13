// import 'dart:html';
import 'dart:io';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:laban/constant/constant.dart';

class PayNow {
  final String email, name, quantity;
  final int price;
  final BuildContext ctx;

  PayNow(
      {required this.name,
      required this.quantity,
      required this.email,
      required this.price,
      required this.ctx});

  ///ref, card ui, plugin, charge func, call

  var paystack = PaystackPlugin();

  String _getRef() {
    String platform;
    if (Platform.isIOS) {
      platform = "IOS";
    } else {
      platform = "Android";
    }

    return "chargedFrom${platform}_for_${name}_${quantity}_${DateTime.now().millisecondsSinceEpoch}";
  }

  PaymentCard cardUi() {
    return PaymentCard(
      name: '',
      number: '507850785078507812',
      cvc: '081',
      expiryMonth: 08,
      expiryYear: 23,
    );
  }

  Future initialisePlugin() async {
    return await paystack.initialize(publicKey: ConstantKey.paystackKey);
  }

  chargeNow() {
    initialisePlugin().then((_) async {
      Charge charge = Charge()
        ..amount = price
        ..email = email
        ..reference = _getRef()
        ..card = cardUi()
        ..currency = "NGN";
      // ..locale = 'USA';
      // charge.amount = price;
      // charge.email = email;

      CheckoutResponse checkoutResponse = await paystack.checkout(ctx,
          charge: charge,
          method: CheckoutMethod.card,
          logo: const FlutterLogo(
            size: 24,
          ));

      if (checkoutResponse.status) {
        print(checkoutResponse.reference);
      } else {
        print(checkoutResponse.message);
      }
    });
  }
}

// import 'dart:html';
import 'dart:io';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:laban/constant/constant.dart';

class PayNow {
  final String email;
  final int price;
  final BuildContext ctx;

  PayNow({required this.email, required this.price, required this.ctx});

  ///ref, card ui, plugin, charge func, call

  var paystack = PaystackPlugin();

  String _getRef() {
    String platform;
    if (Platform.isIOS) {
      platform = "IOS";
    } else {
      platform = "Android";
    }

    return "chargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}";
  }

  PaymentCard cardUi() {
    return PaymentCard(
        number: '0000 0000 00000 0000',
        cvc: '000',
        expiryMonth: 1,
        expiryYear: 1);
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
        ..currency = "USD";
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
        print(checkoutResponse.message);
      } else {
        print(checkoutResponse.message);
      }
    });
  }
}

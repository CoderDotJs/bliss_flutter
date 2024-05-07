import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeForm extends StatefulWidget{
  const StripeForm({super.key});

  @override
  State<StripeForm> createState() => _StripeFormState();
}

class _StripeFormState extends State<StripeForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

    @override
  void initState() async {
    super.initState();
    await initiatePayment();
  }
  Future<void> initiatePayment() async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: const SetupPaymentSheetParameters(customFlow: true, merchantDisplayName: 'Demo App', paymentIntentClientSecret: '')
      );



      // Payment successful
      print('Payment successful');
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ElevatedButton(
        onPressed: () async {
          await Stripe.instance.presentPaymentSheet();
        },
      child: const Row(children: [Icon(Icons.payment), Text("Proceed Payment")],),
      ),
    );
  }
}
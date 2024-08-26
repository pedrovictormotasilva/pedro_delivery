import 'package:data_persistence/components/my_button.dart';
import 'package:data_persistence/components/my_receipt.dart';
import 'package:data_persistence/models/restaurant.dart';
import 'package:data_persistence/pages/delivery_progress_page.dart';
import 'package:data_persistence/services/stripe/stripe_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String currency = 'BRL';

  @override
  Widget build(BuildContext context) {
    final restaurant = Provider.of<Restaurant>(context);
    final totalAmount = restaurant.getTotalPrice();

    // Converter o valor para centavos
    final amountInCents = (totalAmount * 100).toInt().toString();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Center(
          child: Text("Pagamento"),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyReceipt(),
              MyButton(
                onTap: () async {
                  try {
                    await StripeService.initPaymentSheet(
                        amountInCents, currency);

                    await StripeService.presentPaymentSheet();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DeliveryProgressPage()),
                    );
                  } catch (e) {
                    // Lidar com erros
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Falha no pagamento: $e'),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  }
                },
                text: "Pagar R\$${totalAmount.toStringAsFixed(2)}",
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

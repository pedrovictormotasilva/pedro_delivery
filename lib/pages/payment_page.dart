import 'package:data_persistence/components/my_button.dart';
import 'package:data_persistence/pages/delivery_progress_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  //usuario quer pagar

  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      //so mostre o dialog se o forms for valido

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirmar pagamento"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Número do cartão: $cardNumber"),
                Text("Data de validade: $expiryDate"),
                Text("Nome do titular: $cardHolderName"),
                Text("Código CVV: $cvvCode"),
              ],
            ),
          ),
          actions: [
            //botao de cancelar
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),

            //botao de comfirmar
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryProgressPage(),
                  ),
                );
              },
              child: Text("Sim"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: const Text("Pagamento")),
      ),
      body: Column(
        children: [
          //cartao de credito
          CreditCardWidget(
              cardBgColor: Theme.of(context).colorScheme.inversePrimary,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0) {}),

          //forms do cartao de credito
          CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              },
              formKey: formKey),
          const Spacer(),

          MyButton(onTap: userTappedPay, text: "Pagar Agora"),

          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}

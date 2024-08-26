import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeService {
  static String apiBase = 'https://api.stripe.com/v1';
  static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';
  static String secret =
      'sk_test_51Ps2xbJW9JxUNsjR69uYG8MPwvjFkeX2Oo2NYgvlRktFuonRJaGDaX1A2dq4QMyXsiR58UtP3kChi6iV69L2upYu00Cm0KIdme';
  static Map<String, String> headers = {
    'Authorization': 'Bearer ${StripeService.secret}',
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  static void init() {
    Stripe.publishableKey =
        'pk_test_51Ps2xbJW9JxUNsjRJxXJvl73p7Kl1gvh8rKjirugxP0pc54XqLdcVQztWD0mPxcW5Zv3a5kYdYY022TPe5Elpzr0001idVYXZ5';
  }

  static Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      var response = await http.post(
        Uri.parse(StripeService.paymentApiUrl),
        body: body,
        headers: StripeService.headers,
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'Falha ao criar a intenção de pagamento: ${response.body}');
      }
    } catch (e) {
      throw Exception("Falha ao criar uma intenção de pagamento: $e");
    }
  }

  /*
    CARTAO REAL ->
    
  static Future<void> initPaymentSheet(String amount, String currency) async {
    try {
      final paymentIntent = await createPaymentIntent(amount, currency);

      if (paymentIntent.containsKey('client_secret')) {
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntent['client_secret'],
            merchantDisplayName: 'Pedro Delivery',
            style: ThemeMode.system,
          ),
        );
      } else {
        throw Exception("Client secret não encontrado na resposta.");
      }
    } catch (e) {
      throw Exception("Falha ao inicializar a folha de pagamento: $e");
    }
  }*/

  //CARTÃO DE TESTE -->
  static Future<void> initPaymentSheet(String amount, String currency) async {
  try {
    // Crie a intenção de pagamento
    final paymentIntent = await createPaymentIntent(amount, currency);

    // Inicialize a folha de pagamento
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntent['client_secret'],
        merchantDisplayName: 'Pedro Delivery',
        style: ThemeMode.system,
      ),
    );
  } catch (e) {
    throw Exception("Falha ao inicializar a folha de pagamento: $e");
  }
}
  

  static Future<void> presentPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      throw Exception(
        "Falha ao apresentar a folha de pagamento: $e",
      );
    }
  }

  static Future<void> captureAuthorization(String authorizationId, String amount) async {
  try {
    var response = await http.post(
      Uri.parse('https://api.stripe.com/v1/authorizations/$authorizationId/capture'),
      body: {'amount': amount},
      headers: StripeService.headers,
    );
    if (response.statusCode == 200) {
      print('Captura bem-sucedida');
    } else {
      throw Exception('Falha ao capturar a autorização');
    }
  } catch (e) {
    throw Exception("Erro ao capturar autorização: $e");
  }
}

}

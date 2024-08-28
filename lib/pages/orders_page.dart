import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_persistence/components/my_delivery_process_tile.dart';
import 'package:data_persistence/services/auth/auth_service.dart';
import 'package:intl/intl.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    final userEmail = authService.getCurrentUser()?.email;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text('Histórico de pedidos')),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('orders')
            .where('userEmail', isEqualTo: userEmail)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("Nenhum pedido encontrado."));
          }

          final orders = snapshot.data!.docs;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final orderData = orders[index].data() as Map<String, dynamic>;
              final orderText = orderData['orders'] as String;

              return MyDeliveryProcessTile(
                foodName:
                    'Pedido ${index + 1}', // Exibe "Pedido 1", "Pedido 2", etc.
                orderPrice: extractOrderPrice(orderText),
                orderDate: formatDate(orderData['date']),
                onTap: () => _showOrderDetailsDialog(context, orderText),
              );
            },
          );
        },
      ),
    );
  }

  // Função para exibir o diálogo com o recibo completo
  void _showOrderDetailsDialog(BuildContext context, String orderText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalhes do Pedido'),
          content: SingleChildScrollView(
            child: Text(orderText),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  // Extrair e somar os preços individuais dos itens
  String extractOrderPrice(String order) {
    // Regex para encontrar todos os preços individuais no recibo
    final regex = RegExp(r'\$\d+\.\d{2}');
    final matches = regex.allMatches(order);

    double total = 0.0;

    for (final match in matches) {
      final priceString = match.group(0) ?? '';
      final price = double.tryParse(
              priceString.replaceAll('\$', '').replaceAll(',', '.')) ??
          0.0;
      total += price;
    }

    // Divida o total por 2 conforme necessário
    total /= 2;

    return "R\$${total.toStringAsFixed(2)}";
  }

  String formatDate(Timestamp date) {
    final DateTime dateTime = date.toDate();
    return DateFormat('dd MMMM yyyy').format(dateTime);
  }
}

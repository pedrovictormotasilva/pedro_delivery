import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_persistence/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirestoreService {
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');
  final AuthService _authService = AuthService();

  // Salvar os pedidos no banco de dados
  Future<void> saveOrderToDatabase(String receipt) async {
    User? user = _authService.getCurrentUser();

    if (user != null) {
      await orders.add({
        'date': DateTime.now(),
        'orders': receipt,
        'userEmail': user.email,
      });
    } else {
      throw Exception("Erro ao capturar o usuário.");
    }
  }
}

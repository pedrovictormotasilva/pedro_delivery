import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //pegar as colecoes de cada pedido
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');
  //salvar os pedidos no bd
  Future<void> saveOrderToDatabase(String receipt) async {
    await orders.add({
      'date': DateTime.now(),
      'order' : receipt,
      //adicionar mais se necessario
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IdModel {
  String? id;
}

abstract class BaseFirebaseModel<T> {
  T fromJson(Map<String, dynamic> json);

  T? fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      return null;
    }
    // id'yi burada set et
    return fromJson(value);
  }
}

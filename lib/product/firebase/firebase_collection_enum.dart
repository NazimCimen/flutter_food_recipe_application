import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollectionEnum {
  version('version'),
  recipes('recipes'),
  users('users');

  final String collectionName;

  const FirebaseCollectionEnum(this.collectionName);

  CollectionReference getReference(FirebaseFirestore firestore) =>
      firestore.collection(collectionName);
}

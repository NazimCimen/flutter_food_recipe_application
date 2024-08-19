import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

abstract class BaseFirebaseModel<T> extends Equatable {
  final String id;

  const BaseFirebaseModel({required this.id});

  @override
  List<Object?> get props => [id];

  T fromFirestore(DocumentSnapshot doc);

  Map<String, dynamic> toMap();
}

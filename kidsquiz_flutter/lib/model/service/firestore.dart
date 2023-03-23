import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore.g.dart';

@riverpod
FirebaseFirestore firestore(FirestoreRef ref) => FirebaseFirestore.instance;

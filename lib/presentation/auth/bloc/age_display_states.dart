import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AgeDisplayStates {}

class AgesLoading extends AgeDisplayStates {}

class AgesLoaded extends AgeDisplayStates {

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;

  AgesLoaded({required this.ages});
}

class AgesLoadFailure extends AgeDisplayStates {

  final String message;

  AgesLoadFailure({required this.message});
}
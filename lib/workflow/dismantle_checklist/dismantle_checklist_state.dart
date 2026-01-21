import 'package:field_technician_app/data/models/relocation.dart';

abstract class DismantleChecklistState {}

class DismantleChecklistInitial extends DismantleChecklistState {}

class DismantleChecklistLoading extends DismantleChecklistState {}

class DismantleChecklistLoaded extends DismantleChecklistState {
  final Relocation relocation;
  DismantleChecklistLoaded(this.relocation);
}

class DismantleChecklistError extends DismantleChecklistState {
  final String message;
  DismantleChecklistError(this.message);
}

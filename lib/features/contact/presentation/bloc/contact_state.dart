import 'package:equatable/equatable.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object?> get props => [];
}

class ContactInitial extends ContactState {}

class ContactEditing extends ContactState {
  final String name;
  final String email;
  final String projectType;
  final String budget;
  final String message;

  const ContactEditing({
    this.name = '',
    this.email = '',
    this.projectType = '',
    this.budget = '',
    this.message = '',
  });

  @override
  List<Object?> get props => [name, email, projectType, budget, message];
}

class ContactSubmitting extends ContactState {}

class ContactSuccess extends ContactState {
  final String message;
  const ContactSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class ContactFailure extends ContactState {
  final String error;
  const ContactFailure(this.error);

  @override
  List<Object?> get props => [error];
}

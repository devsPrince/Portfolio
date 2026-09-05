import 'package:equatable/equatable.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object?> get props => [];
}

class NameChanged extends ContactEvent {
  final String name;
  const NameChanged(this.name);
  @override
  List<Object?> get props => [name];
}

class EmailChanged extends ContactEvent {
  final String email;
  const EmailChanged(this.email);
  @override
  List<Object?> get props => [email];
}

class ProjectTypeChanged extends ContactEvent {
  final String projectType;
  const ProjectTypeChanged(this.projectType);
  @override
  List<Object?> get props => [projectType];
}

class BudgetChanged extends ContactEvent {
  final String budget;
  const BudgetChanged(this.budget);
  @override
  List<Object?> get props => [budget];
}

class MessageChanged extends ContactEvent {
  final String message;
  const MessageChanged(this.message);
  @override
  List<Object?> get props => [message];
}

class SubmitContactForm extends ContactEvent {
  final String name;
  final String email;
  final String projectType;
  final String budget;
  final String message;

  const SubmitContactForm({
    required this.name,
    required this.email,
    required this.projectType,
    required this.budget,
    required this.message,
  });

  @override
  List<Object?> get props => [name, email, projectType, budget, message];
}

class ResetContactForm extends ContactEvent {}

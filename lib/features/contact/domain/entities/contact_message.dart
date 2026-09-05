import 'package:equatable/equatable.dart';

class ContactMessage extends Equatable {
  final String name;
  final String email;
  final String projectType;
  final String budget;
  final String message;

  const ContactMessage({
    required this.name,
    required this.email,
    required this.projectType,
    required this.budget,
    required this.message,
  });

  @override
  List<Object?> get props => [name, email, projectType, budget, message];
}

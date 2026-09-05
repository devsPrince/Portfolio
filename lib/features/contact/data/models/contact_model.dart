import '../../domain/entities/contact_message.dart';

class ContactModel extends ContactMessage {
  const ContactModel({
    required super.name,
    required super.email,
    required super.projectType,
    required super.budget,
    required super.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'projectType': projectType,
      'budget': budget,
      'message': message,
    };
  }
}

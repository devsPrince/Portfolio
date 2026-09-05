import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactSuccess extends ContactState {
  final String message;
  ContactSuccess(this.message);
}

class ContactError extends ContactState {
  final String error;
  ContactError(this.error);
}

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  Future<void> submitMessage({
    required String name,
    required String email,
    required String projectType,
    required String budget,
    required String message,
  }) async {
    if (name.trim().isEmpty || email.trim().isEmpty || message.trim().isEmpty) {
      emit(ContactError("Please fill in all required fields (Name, Email, Message)."));
      return;
    }
    if (!email.contains('@') || !email.contains('.')) {
      emit(ContactError("Please enter a valid email address."));
      return;
    }

    emit(ContactLoading());

    // Simulate network latency / email sending
    await Future.delayed(const Duration(seconds: 1));

    emit(ContactSuccess("Message sent successfully! I will get back to you within 24 hours."));
  }

  void reset() {
    emit(ContactInitial());
  }
}

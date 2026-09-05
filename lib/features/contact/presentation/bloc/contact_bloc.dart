import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/validators.dart';
import '../../domain/entities/contact_message.dart';
import '../../domain/usecases/submit_contact.dart';
import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final SubmitContact submitContact;

  ContactBloc({required this.submitContact}) : super(ContactInitial()) {
    on<NameChanged>(_onNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<ProjectTypeChanged>(_onProjectTypeChanged);
    on<BudgetChanged>(_onBudgetChanged);
    on<MessageChanged>(_onMessageChanged);
    on<SubmitContactForm>(_onSubmitContactForm);
    on<ResetContactForm>(_onResetContactForm);
  }

  void _onNameChanged(NameChanged event, Emitter<ContactState> emit) {
    if (state is ContactEditing) {
      final current = state as ContactEditing;
      emit(ContactEditing(
        name: event.name,
        email: current.email,
        projectType: current.projectType,
        budget: current.budget,
        message: current.message,
      ));
    } else {
      emit(ContactEditing(name: event.name));
    }
  }

  void _onEmailChanged(EmailChanged event, Emitter<ContactState> emit) {
    if (state is ContactEditing) {
      final current = state as ContactEditing;
      emit(ContactEditing(
        name: current.name,
        email: event.email,
        projectType: current.projectType,
        budget: current.budget,
        message: current.message,
      ));
    } else {
      emit(ContactEditing(email: event.email));
    }
  }

  void _onProjectTypeChanged(ProjectTypeChanged event, Emitter<ContactState> emit) {
    if (state is ContactEditing) {
      final current = state as ContactEditing;
      emit(ContactEditing(
        name: current.name,
        email: current.email,
        projectType: event.projectType,
        budget: current.budget,
        message: current.message,
      ));
    } else {
      emit(ContactEditing(projectType: event.projectType));
    }
  }

  void _onBudgetChanged(BudgetChanged event, Emitter<ContactState> emit) {
    if (state is ContactEditing) {
      final current = state as ContactEditing;
      emit(ContactEditing(
        name: current.name,
        email: current.email,
        projectType: current.projectType,
        budget: event.budget,
        message: current.message,
      ));
    } else {
      emit(ContactEditing(budget: event.budget));
    }
  }

  void _onMessageChanged(MessageChanged event, Emitter<ContactState> emit) {
    if (state is ContactEditing) {
      final current = state as ContactEditing;
      emit(ContactEditing(
        name: current.name,
        email: current.email,
        projectType: current.projectType,
        budget: current.budget,
        message: event.message,
      ));
    } else {
      emit(ContactEditing(message: event.message));
    }
  }

  Future<void> _onSubmitContactForm(SubmitContactForm event, Emitter<ContactState> emit) async {
    if (!Validators.isValidName(event.name)) {
      emit(const ContactFailure("Please enter a valid name (at least 2 characters)."));
      return;
    }
    if (!Validators.isValidEmail(event.email)) {
      emit(const ContactFailure("Please enter a valid email address."));
      return;
    }
    if (!Validators.isValidMessage(event.message)) {
      emit(const ContactFailure("Please enter a message (at least 5 characters)."));
      return;
    }

    emit(ContactSubmitting());

    final message = ContactMessage(
      name: event.name,
      email: event.email,
      projectType: event.projectType,
      budget: event.budget,
      message: event.message,
    );

    final result = await submitContact(message);
    if (result.isSuccess) {
      emit(const ContactSuccess("Message sent successfully! I will get back to you within 24 hours."));
    } else {
      emit(ContactFailure(result.failure?.message ?? "Failed to send message."));
    }
  }

  void _onResetContactForm(ResetContactForm event, Emitter<ContactState> emit) {
    emit(ContactInitial());
  }
}

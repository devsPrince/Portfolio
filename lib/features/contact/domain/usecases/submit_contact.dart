import '../entities/contact_message.dart';
import '../repositories/contact_repository.dart';

class SubmitContact {
  final ContactRepository repository;

  SubmitContact(this.repository);

  Future<EitherResult<bool>> call(ContactMessage message) async {
    return await repository.submitContact(message);
  }
}

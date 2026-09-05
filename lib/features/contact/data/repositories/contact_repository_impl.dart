import '../../../../core/error/failures.dart';
import '../../domain/entities/contact_message.dart';
import '../../domain/repositories/contact_repository.dart';
import '../datasources/contact_remote_data_source.dart';
import '../models/contact_model.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ContactRemoteDataSource remoteDataSource;

  ContactRepositoryImpl(this.remoteDataSource);

  @override
  Future<EitherResult<bool>> submitContact(ContactMessage message) async {
    try {
      final model = ContactModel(
        name: message.name,
        email: message.email,
        projectType: message.projectType,
        budget: message.budget,
        message: message.message,
      );
      final success = await remoteDataSource.sendContact(model);
      return EitherResult(data: success);
    } catch (e) {
      return EitherResult(failure: ServerFailure(e.toString()));
    }
  }
}

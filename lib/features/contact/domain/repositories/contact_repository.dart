import '../../../../core/error/failures.dart';
import '../entities/contact_message.dart';

abstract class ContactRepository {
  Future<EitherResult<bool>> submitContact(ContactMessage message);
}

class EitherResult<T> {
  final T? data;
  final Failure? failure;
  const EitherResult({this.data, this.failure});
  bool get isSuccess => failure == null;
}

import '../models/contact_model.dart';

abstract class ContactRemoteDataSource {
  Future<bool> sendContact(ContactModel contactModel);
}

class ContactRemoteDataSourceImpl implements ContactRemoteDataSource {
  @override
  Future<bool> sendContact(ContactModel contactModel) async {
    // Simulate network latency / API submission
    await Future.delayed(const Duration(milliseconds: 800));
    return true;
  }
}

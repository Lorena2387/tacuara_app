import '../domain/user_register_domain.dart';

abstract class UserRepository {
  Future<void> createUser(User user);
}

abstract class AdminRepository {
  Future<void> createAdmin(Admin admin);
}

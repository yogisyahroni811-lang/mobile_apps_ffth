import 'package:field_technician_app/field_worker_app/app/data/model/user_model.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<void> logout();
}

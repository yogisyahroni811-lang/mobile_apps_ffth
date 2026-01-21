import 'package:field_worker_app/app/data/model/user_model.dart';
import 'package:field_worker_app/app/data/provider/remote/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  @override
  Future<User> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return User(
      id: '1',
      name: 'Alex',
      email: 'alex@email.com',
      avatarUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAzo13-CRHHK0ulIEOsizdbGYRFwTVyKxTRzzuEL_WrAZ5noVyT2iC3en-zPmvQItCWLZoDeQ5B27FLFT_3uJk_33_JdBHAUCpAEeNWfBuTaF5KpOBHifOggAnchhuZrpX_dTIIno1WzNq25asuQoouxuKhLqZeM6fjwxpE4wHFgKpk_nMUAr9x9ceV-YCQCQmpq8s_PVXJGXo-BAAql70PUvAD1f2WRnHH3-gfA2Eg2nIBp6qhKWO9tzl5uvU3d4WsMfHljEk49e69',
    );
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}

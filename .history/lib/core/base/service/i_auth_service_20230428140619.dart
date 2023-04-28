import '../../init/network/dio_manager.dart';
import '../model/auth_model.dart';

abstract class IAuthService {
  final DioManager dioManager;

  IAuthService(this.dioManager);

  Future<AuthModel> login({
    required String email,
    required String password,
  });
}

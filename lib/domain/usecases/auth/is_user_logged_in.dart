import 'package:spotify_clone/core/usecase/usecase.dart';

import '../../../service_locator.dart';
import '../../repository/auth/auth.dart';

class IsUserLoggedInUseCase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({param}) async {
    return sl<AuthRepository>().isUserLoggedIn();
  }
}

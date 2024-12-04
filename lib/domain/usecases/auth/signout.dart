import 'package:spotify_clone/core/usecase/usecase.dart';

import '../../../service_locator.dart';
import '../../repository/auth/auth.dart';

class SignOutUseCase extends UseCase<void, dynamic> {
  @override
  Future<void> call({param}) async {
    return sl<AuthRepository>().signOut();
  }
}

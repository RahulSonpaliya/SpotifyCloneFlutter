import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/entities/auth/user.dart';

import '../../../data/models/failure.dart';
import '../../../service_locator.dart';
import '../../repository/auth/auth.dart';

class GetUserUseCase extends UseCase<Either<Failure, UserEntity>, dynamic> {
  @override
  Future<Either<Failure, UserEntity>> call({param}) async {
    return sl<AuthRepository>().getUser();
  }
}

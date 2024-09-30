import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../repository/auth.dart';

class IsLoggedInUseCase extends UseCase<bool,dynamic> {
  @override
  Future<bool> call({params}) async {
    return await s1<AuthRepository>().isLogged();
  }

}
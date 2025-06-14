import 'package:flutter_application_1/servise_locator.dart';

import '../../../common/bloc/task/task_cubit.dart';
import '../../../domain/auth/usecase/get_user_usecase.dart';

class UserCubit extends TaskCubit{
  Future<void> getUser()async{
    await execute(getIt.call<GetUserUsecase>());
  }
}
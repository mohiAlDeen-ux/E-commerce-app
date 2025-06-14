import 'package:flutter_application_1/domain/auth/usecase/log_out_usecase.dart';
import 'package:flutter_application_1/servise_locator.dart';

import '../../../common/bloc/task/task_cubit.dart';

class LogOutCubit extends TaskCubit {
  Future<void> logOut() async {
    await execute(getIt.call<LogOutUsecase>());
  }
}

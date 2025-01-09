import '../../../common/bloc/task/task_cubit.dart';
import '../../../domain/auth/usecase/get_user_usecase.dart';

class UserCubit extends TaskCubit{
  Future<void> getUser()async{
    await execute(GetUserUsecase());
  }
}
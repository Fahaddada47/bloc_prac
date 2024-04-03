import 'package:bloc_prac/cubit/user_cubit_state.dart';
import 'package:bloc_prac/model/user_model.dart';
import 'package:bloc_prac/service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserCubitState> {
  List<UserModel> userList = [];
  ApiService apiService;

  UserCubit({required this.apiService}) : super(UserCubitInit());

  Future<void> getAllUserList() async {
    try {
      emit(UserCubitLoading());
      userList = await apiService.getData();
      emit(UserCubitDataLoaded(userList: userList));
    } catch (e) {
      emit(UserCubitError(message: e.toString()));
    }
  }
}

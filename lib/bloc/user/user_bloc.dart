import 'package:bloc_prac/bloc/user/user_event.dart';
import 'package:bloc_prac/bloc/user/user_state.dart';
import 'package:bloc_prac/service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  List<UserModel> userModelList = [];

  UserBloc() : super(UserInit()) {
    ApiService _apiservice = ApiService();
    on<GetAllUserList>((event, emit) async {
      try {
        emit(UserLoading());
        userModelList = await _apiservice.getData();
        emit(UserDataLoaded(userModelList));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Data Layer/Model/UserQuarantineModel.dart';
import '../../Data Layer/Provider/UserQuarantineProvider.dart';

part 'UserQuarantine_event.dart';
part 'UserQuarantine_state.dart';

class UserQuarantineBloc extends Bloc<UserQuarantineEvent, UserState> {
  UserQuarantineBloc() : super(UserInitial()) {
    final UserQuarantineProvider userProvider = UserQuarantineProvider();

    //get all user list
    on<GetUserList>((event, emit) async {
      emit(UserLoading());
      final listUser = await userProvider.getAllUserlDataProvider();
      emit(IndexUserLoad(listUser));
    });

    //insert user
    on<InsertUserData>((event, emit) async {
      await userProvider.saveUserData(event.userModel);
    });

    //delete
    on<DeleteUserData>((event, emit) async {
      await userProvider.deleteUserData(event.userId);
    });

    //get specific user
    on<GetUserData>((event, emit) async {
      emit(UserLoading());
      final updateUser =
          await userProvider.getSpecificUserDataProvider(event.userId);
      emit(UpdateUserLoad(updateUser));
    });

    //delete
    on<UpdateUserData>((event, emit) async {
      await userProvider.updateUserDataProvider(event.userModel);
    });
  }
}
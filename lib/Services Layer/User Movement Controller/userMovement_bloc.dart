import 'package:bloc/bloc.dart';
import 'package:c_h_c/Data%20Layer/Model/UserMovementModel.dart';
import 'package:equatable/equatable.dart';

import '../../Data Layer/Provider/UserMovementProvider.dart';


part 'userMovement_event.dart';
part 'userMovement_state.dart';

class UserMovementBloc extends Bloc<UserEvent, UserState> {
  UserMovementBloc() : super(UserInitial()) {

    final UserMovementProvider userMovementProvider = UserMovementProvider();

    //get all user list
    on<GetUserList>((event, emit) async {
      emit(UserLoading());
      final listUser = await userMovementProvider.getAllUserlDataProvider();
      emit(IndexUserLoad(listUser));
    });

    //insert user
    on<InsertUserData>((event, emit) async {
       await userMovementProvider.saveUserData(event.userMovementModel);
    });

    //delete
    on<DeleteUserData>((event, emit) async{
      await  userMovementProvider.deleteUserData(event.userId);
    });

    //get specific user
    on<GetUserData>((event, emit) async{
      emit(UserLoading());
      final updateUser = await  userMovementProvider.getSpecificUserDataProvider(event.userId);
      emit(UpdateUserLoad(updateUser));
    });

    //delete
    // on<UpdateUserData>((event, emit) async{
    //   await  userMovementProvider.updateUserDataProvider(event.userMovementModel);
    // });
  }
}


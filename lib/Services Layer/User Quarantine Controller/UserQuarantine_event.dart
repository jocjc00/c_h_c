part of 'UserQuarantine_bloc.dart';

abstract class UserQuarantineEvent extends Equatable {
  const UserQuarantineEvent();
  @override
  List<Object> get props => [];
}

//get list of user data
class GetUserList extends UserQuarantineEvent {}

//add data
class InsertUserData extends UserQuarantineEvent {
  final UserQuarantineModel userModel;
  const InsertUserData(this.userModel);
}

//delete user data
class DeleteUserData extends UserQuarantineEvent {
  final int userId;
  const DeleteUserData(this.userId);
}

//get specific user data
class GetUserData extends UserQuarantineEvent {
  final int userId;
  const GetUserData(this.userId);
}

//udata user data
class UpdateUserData extends UserQuarantineEvent {
  final UserQuarantineModel userModel;
  const UpdateUserData(this.userModel);
}

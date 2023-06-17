part of 'UserQuarantine_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

//update user load
class UpdateUserLoad extends UserState {
  final UserQuarantineModel userModel;
  const UpdateUserLoad(this.userModel);
}

//display list user Index
class IndexUserLoad extends UserState {
  final List<UserQuarantineModel> userModel;
  const IndexUserLoad(this.userModel);
}

class UserError extends UserState {
  final String? message;
  const UserError(this.message);
}

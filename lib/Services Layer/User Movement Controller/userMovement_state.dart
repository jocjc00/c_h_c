part of 'userMovement_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

//update user load
class UpdateUserLoad extends UserState {
  final UserMovementModel userMovementModel;
  const UpdateUserLoad(this.userMovementModel);
}

//display list user Index
class IndexUserLoad extends UserState {
  final List<UserMovementModel> userMovementModel;
  const IndexUserLoad(this.userMovementModel);
}

class UserError extends UserState {
  final String? message;
  const UserError(this.message);
}
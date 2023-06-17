part of 'adminMsg_bloc.dart';

abstract class AdminMsgState extends Equatable {
  const AdminMsgState();
  @override
  List<Object> get props => [];
}

class AdminMsgInitial extends AdminMsgState {}

class AdminMsgLoading extends AdminMsgState {}

//update msg load
class UpdateAdminMsgLoad extends AdminMsgState {
  final AdminMsgModel adminMsgModel;
  const UpdateAdminMsgLoad(this.adminMsgModel);
}

//display list user Index
class IndexAdminMsgLoad extends AdminMsgState {
  final List<AdminMsgModel> adminMsgModel;
  const IndexAdminMsgLoad(this.adminMsgModel);
}

class MsgError extends AdminMsgState {
  final String? message;
  const MsgError(this.message);
}
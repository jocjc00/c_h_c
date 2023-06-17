part of 'adminMsg_bloc.dart';

abstract class AdminMsgEvent extends Equatable {
  const AdminMsgEvent();
  @override
  List<Object> get props => [];
}
//get list of msg data
class GetMsgList extends AdminMsgEvent {}

//add data
class InsertAdminMsgData extends AdminMsgEvent {
  final AdminMsgModel adminMsgModel;
  const InsertAdminMsgData(this.adminMsgModel);
}
//delete msg data
class DeleteAdminMsgData extends AdminMsgEvent {
  final int msgId;
  const DeleteAdminMsgData(this.msgId);
}

//get specific msg data
class GetMsgData extends AdminMsgEvent {
  final int msgId;
  const GetMsgData(this.msgId);
}

//update msg data
class UpdateAdminMsgData extends AdminMsgEvent {
  final AdminMsgModel adminMsgModel;
  const UpdateAdminMsgData(this.adminMsgModel);
}
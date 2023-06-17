part of 'adminInfo_bloc.dart';

abstract class AdminInfoEvent extends Equatable {
  const AdminInfoEvent();
  @override
  List<Object> get props => [];
}
//get list of admin data
class GetAdminList extends AdminInfoEvent {}

//add data
class InsertAdminData extends AdminInfoEvent {
  final AdminInfoModel adminInfoModel;
  const InsertAdminData(this.adminInfoModel);
}
//delete admin data
class DeleteAdminData extends AdminInfoEvent {
  final int adminId;
  const DeleteAdminData(this.adminId);
}

//get specific admin data
class GetAdminData extends AdminInfoEvent {
  final int adminId;
  const GetAdminData(this.adminId);
}

//update admin data
class UpdateAdminData extends AdminInfoEvent {
  final AdminInfoModel adminInfoModel;
  const UpdateAdminData(this.adminInfoModel);
}
part of 'MOHVaccStatus_bloc.dart';

abstract class AdminEvent extends Equatable {
  const AdminEvent();
  @override
  List<Object> get props => [];
}

//get list of admin data
class GetAdminList extends AdminEvent {}

//add data
class InsertAdminData extends AdminEvent {
  final AdminVacModel adminVacModel;
  const InsertAdminData(this.adminVacModel);
}

//delete admin data
class DeleteAdminData extends AdminEvent {
  final int adminId;
  const DeleteAdminData(this.adminId);
}

//get specific admin data
class GetAdminData extends AdminEvent {
  final int adminId;
  const GetAdminData(this.adminId);
}

//update admin data
class UpdateAdminData extends AdminEvent {
  final AdminVacModel adminVacModel;
  const UpdateAdminData(this.adminVacModel);
}

part of 'adminInfo_bloc.dart';

abstract class AdminInfoState extends Equatable {
  const AdminInfoState();
  @override
  List<Object> get props => [];
}

class AdminInitial extends AdminInfoState {}

class AdminLoading extends AdminInfoState {}

//update admin load
class UpdateAdminLoad extends AdminInfoState {
  final AdminInfoModel adminInfoModel;
  const UpdateAdminLoad(this.adminInfoModel);
}

//display list admin Index
class IndexAdminLoad extends AdminInfoState {
  final List<AdminInfoModel> adminInfoModel;
  const IndexAdminLoad(this.adminInfoModel);
}

class AdminError extends AdminInfoState {
  final String? message;
  const AdminError(this.message);
}
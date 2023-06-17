part of 'MOHVaccStatus_bloc.dart';

abstract class AdminState extends Equatable {
  const AdminState();
  @override
  List<Object> get props => [];
}

class AdminInitial extends AdminState {}

class AdminLoading extends AdminState {}

//update admin load
class UpdateAdminLoad extends AdminState {
  final AdminVacModel adminVacModel;
  const UpdateAdminLoad(this.adminVacModel);
}

//display list admin Index
class IndexAdminLoad extends AdminState {
  final List<AdminVacModel> adminVacModel;
  const IndexAdminLoad(this.adminVacModel);
}

class AdminError extends AdminState {
  final String? message;
  const AdminError(this.message);
}

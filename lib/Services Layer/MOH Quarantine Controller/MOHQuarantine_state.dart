part of 'MOHQuarantine_bloc.dart';

abstract class MOHQuarantineState extends Equatable {
  const MOHQuarantineState();
  @override
  List<Object> get props => [];
}

class AdminInitial extends MOHQuarantineState {}

class AdminLoading extends MOHQuarantineState {}

//update admin load
class UpdateAdminLoad extends MOHQuarantineState {
  final MOHQuarantineModel adminModel;
  const UpdateAdminLoad(this.adminModel);
}

//display list admin Index
class IndexAdminLoad extends MOHQuarantineState {
  final List<MOHQuarantineModel> adminModel;
  const IndexAdminLoad(this.adminModel);
}

class AdminError extends MOHQuarantineState {
  final String? message;
  const AdminError(this.message);
}

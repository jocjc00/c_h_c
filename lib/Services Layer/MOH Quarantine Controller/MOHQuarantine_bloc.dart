import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Data Layer/Model/MOHQuarantineModel.dart';
import '../../Data Layer/Provider/MOHQuarantineProvider.dart';

part 'MOHQuarantine_event.dart';
part 'MOHQuarantine_state.dart';

class MOHQuarantineBloc extends Bloc<AdminEvent, MOHQuarantineState> {
  MOHQuarantineBloc() : super(AdminInitial()) {
    final MOHQuarantineProvider adminProvider = MOHQuarantineProvider();

    //get all admin list
    on<GetAdminList>((event, emit) async {
      emit(AdminLoading());
      final listAdmin = await adminProvider.getAllAdminlDataProvider();
      emit(IndexAdminLoad(listAdmin));
    });

    //insert admin
    on<InsertAdminData>((event, emit) async {
      await adminProvider.saveAdminData(event.adminModel);
    });

    //delete
    on<DeleteAdminData>((event, emit) async {
      await adminProvider.deleteAdminData(event.adminId);
    });

    //get specific admin
    on<GetAdminData>((event, emit) async {
      emit(AdminLoading());
      final updateAdmin =
          await adminProvider.getSpecificAdminDataProvider(event.adminId);
      emit(UpdateAdminLoad(updateAdmin));
    });

    //update
    on<UpdateAdminData>((event, emit) async {
      await adminProvider.updateAdminDataProvider(event.adminModel);
    });
  }
}
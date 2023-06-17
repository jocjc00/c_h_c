import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Data Layer/Model/MOHVaccinationModel.dart';
import '../../Data Layer/Provider/MOHVaccinationProvider.dart';

part 'MOHVaccStatus_event.dart';
part 'MOHVaccStatus_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(AdminInitial()) {
    final AdminVacProvider adminVacProvider = AdminVacProvider();

    //get all admin list
    on<GetAdminList>((event, emit) async {
      emit(AdminLoading());
      final listAdmin = await adminVacProvider.getAllAdminlDataProvider();
      emit(IndexAdminLoad(listAdmin));
    });

    //insert admin
    on<InsertAdminData>((event, emit) async {
      await adminVacProvider.saveAdminData(event.adminVacModel);
    });

    //delete
    on<DeleteAdminData>((event, emit) async {
      await adminVacProvider.deleteAdminData(event.adminId);
    });

    //get specific admin
    on<GetAdminData>((event, emit) async {
      emit(AdminLoading());
      final updateAdmin =
          await adminVacProvider.getSpecificAdminDataProvider(event.adminId);
      emit(UpdateAdminLoad(updateAdmin));
    });

    //update
    on<UpdateAdminData>((event, emit) async {
      await adminVacProvider.updateAdminDataProvider(event.adminVacModel);
    });
  }
}

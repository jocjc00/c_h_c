import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Data Layer/Model/AdminInfoModel.dart';
import '../../Data Layer/Provider/AdminInfoProvider.dart';

part 'adminInfo_event.dart';
part 'adminInfo_state.dart';

class AdminInfoBloc extends Bloc<AdminInfoEvent, AdminInfoState> {
  AdminInfoBloc() : super(AdminInitial()) {
    final AdminInfoProvider adminInfoProvider = AdminInfoProvider();

    //get all admin list
    on<GetAdminList>((event, emit) async {
      emit(AdminLoading());
      final listAdmin = await adminInfoProvider.getAllAdminlDataProvider();
      emit(IndexAdminLoad(listAdmin));
    });

    //insert admin
    on<InsertAdminData>((event, emit) async {
      await adminInfoProvider.saveAdminData(event.adminInfoModel);
    });

    //delete
    on<DeleteAdminData>((event, emit) async{
      await  adminInfoProvider.deleteAdminData(event.adminId);
    });

    //get specific admin
    on<GetAdminData>((event, emit) async{
      emit(AdminLoading());
      final updateAdmin = await  adminInfoProvider.getSpecificAdminDataProvider(event.adminId);
      emit(UpdateAdminLoad(updateAdmin));
    });

    //update
    on<UpdateAdminData>((event, emit) async{
      await  adminInfoProvider.updateAdminDataProvider(event.adminInfoModel);
    });
  }
}

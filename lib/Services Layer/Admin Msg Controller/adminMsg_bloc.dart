import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Data Layer/Model/AdminMsgModel.dart';
import '../../Data Layer/Provider/AdminMsgProvider.dart';

part 'adminMsg_event.dart';
part 'adminMsg_state.dart';

class AdminMsgBloc extends Bloc<AdminMsgEvent, AdminMsgState> {
  AdminMsgBloc() : super(AdminMsgInitial()) {

    final AdminMsgProvider adminMsgProvider = AdminMsgProvider();

    //get all msg list
    on<GetMsgList>((event, emit) async {
      emit(AdminMsgLoading());
      final listMsg = await adminMsgProvider.getAllMsglDataProvider();
      emit(IndexAdminMsgLoad(listMsg));
    });

    //insert msg
    on<InsertAdminMsgData>((event, emit) async {
       await adminMsgProvider.saveMsgData(event.adminMsgModel);
    });

    //delete
    on<DeleteAdminMsgData>((event, emit) async{
      await  adminMsgProvider.deleteMsgData(event.msgId);
    });

    //get specific user
    on<GetMsgData>((event, emit) async{
      emit(AdminMsgLoading());
      final updateMsg = await  adminMsgProvider.getSpecificMsgDataProvider(event.msgId);
      emit(UpdateAdminMsgLoad(updateMsg));
    });

    //delete
    on<UpdateAdminMsgData>((event, emit) async{
      await  adminMsgProvider.updateMsgDataProvider(event.adminMsgModel);
    });
  }
}

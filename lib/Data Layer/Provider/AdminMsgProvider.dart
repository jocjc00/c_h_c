import '../Model/AdminMsgModel.dart';
import '../Repository/infoMsg_db.dart';

class AdminMsgProvider {
  final _adminMsgProvider = InfoMsg.instance;

  //get all msg data
  Future<List<AdminMsgModel>> getAllMsglDataProvider() {
    return _adminMsgProvider.getAllMsgData();
  }

  //insert msg data
  Future<int> saveMsgData(adminMsgModel) {
    return _adminMsgProvider.addMsg(adminMsgModel);
  }

  //get specific msg data
  Future<AdminMsgModel> getSpecificMsgDataProvider(int value) {
    return _adminMsgProvider.getSpecificMsgData(value);
  }

  //update msg data
  Future<int> updateMsgDataProvider(adminMsgModel) {
    return _adminMsgProvider.updateMsg(adminMsgModel);
  }

  //delete msg data
  Future<int> deleteMsgData(int value) {
    return _adminMsgProvider.deleteMsg(value);
  }
}

import '../Model/AdminInfoModel.dart';
import '../Repository/infoMsg_db.dart';

class AdminInfoProvider
{
  final _adminInfoProvider = InfoMsg.instance;

  //get all info
  Future<List<AdminInfoModel>> getAllAdminlDataProvider()
  {
    return _adminInfoProvider.getAllAdminData();
  }

  //insert info data
  Future<int> saveAdminData(adminInfoModel)
  {
    return _adminInfoProvider.addAdmin(adminInfoModel);
  }

  //get specific info data
  Future<AdminInfoModel> getSpecificAdminDataProvider(int value)
  {
    return _adminInfoProvider.getSpecificAdminData(value);
  }

  //update info data
  Future<int> updateAdminDataProvider(adminInfoModel)
  {
    return _adminInfoProvider.updateAdmin(adminInfoModel);
  }

  //delete info data
  Future<int> deleteAdminData(int value)
  {
    return _adminInfoProvider.deleteAdmin(value);
  }



}
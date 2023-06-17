import '../Model/MOHQuarantineModel.dart';
import '../Repository/quarantine_db.dart';

class MOHQuarantineProvider {
  final _MOHQuarantineProvider = Quarantine.instance;

  //get all admin
  Future<List<MOHQuarantineModel>> getAllAdminlDataProvider() {
    return _MOHQuarantineProvider.getAllAdminData();
  }

  //insert admin data
  Future<int> saveAdminData(adminModel) {
    return _MOHQuarantineProvider.addAdmin(adminModel);
  }

  //get specific admin data
  Future<MOHQuarantineModel> getSpecificAdminDataProvider(int value) {
    return _MOHQuarantineProvider.getSpecificAdminData(value);
  }

  //update admin data
  Future<int> updateAdminDataProvider(adminModel) {
    return _MOHQuarantineProvider.updateAdmin(adminModel);
  }

  //delete admin data
  Future<int> deleteAdminData(int value) {
    return _MOHQuarantineProvider.deleteAdmin(value);
  }
}

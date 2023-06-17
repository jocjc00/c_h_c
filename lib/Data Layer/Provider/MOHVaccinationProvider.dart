import '../Model/MOHVaccinationModel.dart';
import '../Repository/vaccination_db.dart';

class AdminVacProvider {
  final _adminVacProvider = Vaccination.instance;

  //get all admin
  Future<List<AdminVacModel>> getAllAdminlDataProvider() {
    return _adminVacProvider.getAllAdminData();
  }

  //insert admin data
  Future<int> saveAdminData(adminVacModel) {
    return _adminVacProvider.addAdmin(adminVacModel);
  }

  //get specific admin data
  Future<AdminVacModel> getSpecificAdminDataProvider(int value) {
    return _adminVacProvider.getSpecificAdminData(value);
  }

  //update admin data
  Future<int> updateAdminDataProvider(adminVacModel) {
    return _adminVacProvider.updateAdmin(adminVacModel);
  }

  //delete admin data
  Future<int> deleteAdminData(int value) {
    return _adminVacProvider.deleteAdmin(value);
  }
}

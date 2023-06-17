import '../Model/UserQuarantineModel.dart';
import '../Repository/quarantine_db.dart';

class UserQuarantineProvider {
  final _UserQuarantineProvider = Quarantine.instance;

  //get all user data
  Future<List<UserQuarantineModel>> getAllUserlDataProvider() {
    return _UserQuarantineProvider.getAllUserData();
  }

  //insert user data
  Future<int> saveUserData(userModel) {
    return _UserQuarantineProvider.addUser(userModel);
  }

  //get specific user data
  Future<UserQuarantineModel> getSpecificUserDataProvider(int value) {
    return _UserQuarantineProvider.getSpecificUserData(value);
  }

  //update user data
  Future<int> updateUserDataProvider(userModel) {
    return _UserQuarantineProvider.updateUser(userModel);
  }

  //delete user data
  Future<int> deleteUserData(int value) {
    return _UserQuarantineProvider.deleteUser(value);
  }
}
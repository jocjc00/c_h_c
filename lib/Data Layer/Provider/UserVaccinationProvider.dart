import '../Model/UserVaccinationModel.dart';
import '../Repository/vaccination_db.dart';

class UserProvider {
  final _userProvider = Vaccination.instance;

  //get all user data
  Future<List<UserModel>> getAllUserlDataProvider() {
    return _userProvider.getAllUserData();
  }

  //insert user data
  Future<int> saveUserData(userModel) {
    return _userProvider.addUser(userModel);
  }

  //get specific user data
  Future<UserModel> getSpecificUserDataProvider(int value) {
    return _userProvider.getSpecificUserData(value);
  }

  //update user data
  Future<int> updateUserDataProvider(userModel) {
    return _userProvider.updateUser(userModel);
  }

  //delete user data
  Future<int> deleteUserData(int value) {
    return _userProvider.deleteUser(value);
  }
}

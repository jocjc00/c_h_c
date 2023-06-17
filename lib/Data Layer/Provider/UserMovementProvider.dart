import '../Model/UserMovementModel.dart';
import '../Repository/movement_db.dart';

class UserMovementProvider
{
  final _userMovementProvider = Movement.instance;

  //get all user data
  Future<List<UserMovementModel>> getAllUserlDataProvider()
  {
    return _userMovementProvider.getAllUserData();
  }

  //insert user data
  Future<int> saveUserData(userMovementModel)
  {
    return _userMovementProvider.addUser(userMovementModel);
  }

  //get specific user data
  Future<UserMovementModel> getSpecificUserDataProvider(int value)
  {
    return _userMovementProvider.getSpecificUserData(value);
  }

  // //update user data
  // Future<int> updateUserDataProvider(userMovementModel)
  // {
  //   return _userMovementProvider.updateUser(userMovementModel);
  // }

  //delete user data
  Future<int> deleteUserData(int value)
  {
    return _userMovementProvider.deleteUser(value);
  }



}
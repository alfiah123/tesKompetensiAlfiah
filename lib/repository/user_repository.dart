import '../model/modelUser.dart';

class UserRepository {
  static List<UserModel> users = [
    UserModel(
      username: 'admin',
      address: 'riau',
      role: 'admin',
      password: '123',
    ),
    UserModel(
      username: 'alfiah',
      address: 'duri',
      role: 'user',
      password: '123',
    ),
  ];

  static void addUser(UserModel user) {
    users.add(user);
  }

  static UserModel? getUserByUsername(String username) {
    try {
      return users.firstWhere((user) => user.username == username);
    } catch (e) {
      return null;
    }
  }

  static UserModel? loggedInUser;
}

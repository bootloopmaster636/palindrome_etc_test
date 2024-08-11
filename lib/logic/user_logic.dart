import 'package:get/get.dart';
import 'package:suitmedia_test/data/api/user_api.dart';
import 'package:suitmedia_test/data/model/users.dart';

class UserController extends GetxController {
  final usersList = <UserModel>[].obs;
  final selectedUser = const UserModel(
    imageUrl: '',
    firstName: '',
    lastName: '',
    email: '',
  ).obs;
  int total = 0;

  Future<void> getUsers({int? page, int? perPage}) async {
    if (usersList.length != total || usersList.isEmpty) {
      final response = await UserApi().getUsers(page ?? 1, perPage);
      final List<UserModel> newUsersList = (response.body['data'] as List<dynamic>).map((data) {
        return UserModel.fromJson(data as Map<String, dynamic>);
      }).toList();

      total = response.body['total'] as int;

      if (usersList.length <= total) {
        // append ke list sesuai dengan indeks
        usersList.addAll(newUsersList);
      }
    }
  }

  Future<void> refreshUsers() {
    resetUsers();
    return getUsers(page: 1);
  }

  Future<void> selectUser(UserModel user) async {
    selectedUser.value = user;
  }

  void resetUsers() {
    usersList.clear();
  }
}

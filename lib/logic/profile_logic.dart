import 'package:get/get.dart';
import 'package:suitmedia_test/data/model/users.dart';

class ProfileController extends GetxController {
  final name = ''.obs;
  final selectedUser = const UserModel(
    imageUrl: '',
    firstName: '',
    lastName: '',
    email: '',
  ).obs;

  void setName(String input) {
    name.value = input;
  }

  void selectUser(UserModel user) {
    selectedUser.value = user;
  }
}

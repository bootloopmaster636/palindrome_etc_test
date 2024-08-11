import 'package:get/get.dart';

class ProfileController extends GetxController {
  final name = ''.obs;

  void setName(String input) {
    name.value = input;
  }
}

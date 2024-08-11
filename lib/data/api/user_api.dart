import 'package:get/get.dart';
import 'package:logger/logger.dart';

class UserApi extends GetConnect {
  Future<Response> getUsers(int page, int? perPage) {
    final url = 'https://reqres.in/api/users?page=$page&per_page=${perPage ?? 10}';
    Logger().i('GET: $url');
    return get(url);
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/data/model/users.dart';
import 'package:suitmedia_test/logic/profile_logic.dart';
import 'package:suitmedia_test/logic/user_logic.dart';
import 'package:toastification/toastification.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Third Screen',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.blue[800],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: UsersList(),
      ),
    );
  }
}

class UsersList extends StatefulWidget {
  const UsersList({
    super.key,
  });

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final scrollCtl = ScrollController();
  var pageNum = 1;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollCtl.addListener(_scrollListener);
    final controller = Get.put(UserController());
    controller.getUsers(page: 1, perPage: 10);
  }

  @override
  void dispose() {
    Get.delete<UserController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userCtl = Get.find<UserController>();

    return Obx(
      () => RefreshIndicator(
        onRefresh: () async {
          pageNum = 1;
          await userCtl.refreshUsers();
        },
        child: userCtl.usersList.isEmpty
            ? const Center(
                child: Text('No data available'),
              )
            : ListView.separated(
                controller: scrollCtl,
                separatorBuilder: (context, index) => const Divider(),
                itemCount: userCtl.usersList.length,
                itemBuilder: (context, index) {
                  final user = userCtl.usersList[index];
                  return UserTile(
                    imageUrl: user.imageUrl,
                    firstName: user.firstName,
                    lastName: user.lastName,
                    email: user.email,
                  );
                },
              ),
      ),
    );
  }

  void _scrollListener() {
    if (scrollCtl.position.pixels == scrollCtl.position.maxScrollExtent) {
      final controller = Get.find<UserController>();
      pageNum++;
      controller.getUsers(page: pageNum, perPage: 10);
    }
  }
}

class UserTile extends StatelessWidget {
  const UserTile({
    required this.imageUrl,
    required this.firstName,
    required this.lastName,
    required this.email,
    super.key,
  });

  final String imageUrl;
  final String firstName;
  final String lastName;
  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          controller.selectUser(UserModel(
            imageUrl: imageUrl,
            firstName: firstName,
            lastName: lastName,
            email: email,
          ));

          toastification.show(
            context: context, // optional if you use ToastificationWrapper
            title: const Text('User have been selected, you can go back now'),
            description: const Text(
                'not going back automatically because the question said: "(don\'t create a new screen, just continue the current screen)."'),
            autoCloseDuration: const Duration(seconds: 5),
            alignment: Alignment.bottomCenter,
          );
        },
        child: Row(
          // tidak jadi pakai listtile karena layoutnya kurang rapi
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 56,
                height: 56,
              ),
            ),
            const Gap(16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$firstName $lastName',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  email,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

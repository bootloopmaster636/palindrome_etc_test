import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/logic/user_logic.dart';
import 'package:suitmedia_test/screen/third_screen.dart';
import 'package:tinycolor2/tinycolor2.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Second Screen',
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
      body: const Content(),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Welcome'),
          const Text(
            'John Doe',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SelectedUser(),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: FilledButton(
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: TinyColor.fromString('#2B637B').color,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdScreen()),
                );
              },
              child: const Text('Choose a User'),
            ),
          ),
          const Gap(8),
        ],
      ),
    );
  }
}

class SelectedUser extends StatelessWidget {
  const SelectedUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Obx(
      () => Expanded(
        child: Center(
          child: Text(
            'Selected User: ${controller.selectedUser.value.firstName} ${controller.selectedUser.value.lastName}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

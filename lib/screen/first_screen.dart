import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:suitmedia_test/screen/second_screen.dart';
import 'package:tinycolor2/tinycolor2.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/first-bg.png',
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Content(),
          ),
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 50,
          foregroundImage: AssetImage('assets/btn-add-photo.png'),
          backgroundColor: Colors.transparent,
        ),
        const Gap(52),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Name',
            hintStyle: const TextStyle(color: Colors.black45),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const Gap(16),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Palindrome',
            hintStyle: const TextStyle(color: Colors.black45),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const Gap(36),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: TinyColor.fromString('#2B637B').color,
            ),
            onPressed: () {},
            child: const Text('CHECK'),
          ),
        ),
        const Gap(16),
        SizedBox(
          width: double.infinity,
          height: 48,
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
                MaterialPageRoute(builder: (context) => const SecondScreen()),
              );
            },
            child: const Text('NEXT'),
          ),
        ),
      ],
    );
  }
}

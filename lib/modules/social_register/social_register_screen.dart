

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SocialRegisterScreen  extends StatelessWidget {
  const SocialRegisterScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            'REGISTER',
            style: Theme.of(context).textTheme.headline4?.copyWith(
              color: Colors.black,
            ),
          ),

        ],
      ),
    );
  }
}

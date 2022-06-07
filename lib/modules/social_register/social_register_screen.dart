// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:manssour_chat_social_app/components/components.dart';

class SocialRegisterScreen extends StatelessWidget {
   // SocialRegisterScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
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
          Text(
            'Register now to communicate with friends',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.grey,
                ),
          ),
          SizedBox(
            height: 30.0,
          ),
          defaultFormField(
            controller: nameController,
            type: TextInputType.name,
              validate:(value){
                if (value!.isEmpty) {
                  return 'please enter your name';
                }
                return null;
              }
          ),
        ],
      ),
    );
  }
}

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../social_register/social_register_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SocialLoginScreen extends StatelessWidget {
  SocialLoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
        create: (BuildContext context) => SocialLoginCubit(),
        child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
            listener: (BuildContext context, SocialLoginStates state) {},
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(),
                body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LOGIN',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              'Login now to browse our hot offers',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(color: Colors.black),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            defaultFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter your email address';
                                }
                                return null;
                              },
                              label: 'Email Address',
                              prefix: Icons.email_outlined,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            defaultFormField(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
// suffix: ShopLoginCubit.get(context).suffix,
                              onSubmit: (value) {
                                if (formKey.currentState!.validate()) {
                                  SocialLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              suffixPressed: () {
                                SocialLoginCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              isPassword:
                                  SocialLoginCubit.get(context).isPassword,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'password is too short';
                                }
                                return null;
                              },
                              label: 'Password',
                              prefix: Icons.lock_outline,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            ConditionalBuilder(
                              condition: state is! SocialLoginLoadingState,
                              builder: (BuildContext context) => defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    SocialLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                text: ('login'),
                                isUpperCase: true,
                              ),
                              fallback: (BuildContext context) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don\'t have an account?',
                                ),
                                defaultTextButton(
                                  function: () {
                                    navigateTo(context, SocialRegisterScreen());
                                  },
                                  text: ('register'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}



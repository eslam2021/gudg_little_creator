import 'dart:developer';
import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firist_project/modules/home/home.dart';
import 'package:firist_project/modules/login/cubit/states.dart';
import 'package:firist_project/screens/register/register.dart';
import 'package:firist_project/shared/Colors.dart';
import 'package:firist_project/shared/components/components.dart';
import 'package:firist_project/shared/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
class Login extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if(state is LoginSuccessState){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [kPrimaryColor, kBackgroundColor],
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                          ),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100))),
                      child: Center(
                        child: CircleAvatar(
                          radius: 80.0,
                          backgroundImage: AssetImage('images/CH.jpg'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            defaultFormField(
                              controller: emailController,
                              label: 'البريد الالكتروني',
                              prefix: Icons.email,
                              type: TextInputType.emailAddress,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'يجب ادخال البريد الالكتروني';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            defaultFormField(
                              controller: passwordController,
                              label: 'كلمةالمرور',
                              prefix: Icons.lock,
                              suffix: isPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              onSubmit:(value){
                                if (formKey.currentState!.validate()) {
                                  loginCubit.userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              isPassword: isPassword,
                              suffixPressed: () {},
                              type: TextInputType.visiblePassword,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'يجب ادخال كلمةالمرور ';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            ConditionalBuilder(
                              condition:!loginCubit.isButtonLoading,
                              builder: (context) => CustomButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    log('send link pressed');
                                    loginCubit.userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                },
                                text: 'تسجيل الدخول',
                              ),
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Register()));
                                    },
                                    child: Text(
                                      'سجل الان',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff951a49)),
                                    )),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'ليس لدي حساب ؟',
                                  style: TextStyle(
                                    color: Colors.green[500],
                                    fontFamily: 'ElMessiri',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

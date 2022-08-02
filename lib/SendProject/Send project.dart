import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firist_project/SendProject/cubit5/cubit5.dart';
import 'package:firist_project/modules/home/home.dart';
import 'package:firist_project/shared/Colors.dart';
import 'package:firist_project/shared/components/components.dart';
import 'package:firist_project/shared/components/custom_button.dart';
import 'package:firist_project/shared/utils/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../SendProject/cubit5/states5.dart';

class SendProject extends StatefulWidget {
  @override
  _SendProjectState createState() => _SendProjectState();
}

class _SendProjectState extends State<SendProject> {
  var SendprojectController = TextEditingController();
  var formKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final sendprojectCubit = BlocProvider.of<SendprojectCubit>(context);
    return BlocConsumer<SendprojectCubit, SendprojectStates>(
        listener: (context, state) {
      if (state is SendprojectSuccessState) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      }
      if (state is SendprojectErrorState) {
        showStyledToast(context, message: state.error);
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.0),
          child: AppBar(
            elevation: 0,
            backgroundColor: Color5,
            flexibleSpace: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      child: Image.asset("images/ministry-logo-header.png",
                          fit: BoxFit.cover),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Container(
                      height: 40,
                      child: Image.asset("images/logo.png", fit: BoxFit.cover),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Container(
                      height: 40,
                      child:
                          Image.asset("images/scc-logo.png", fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Form(
              key: formKey3,
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
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40.0,
                          ),
                          defaultFormField(
                            controller: SendprojectController,
                            label: 'رابط المشروع(رابط درايف)',
                            type: TextInputType.text,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'برجاء ادخال لينك المشروع';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 60.0,
                          ),
                          ConditionalBuilder(
                            condition: !sendprojectCubit.isButtonLoading,
                            builder: (context) => CustomButton(
                              onPressed: () {

                                  if (formKey3.currentState!.validate()) {
                                    log('send link pressed');
                                    sendprojectCubit.userSendproject(
                                      driveLink: SendprojectController.text,
                                    );
                                  }

                              },
                              text: 'ارسال الرابط',
                            ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }





}

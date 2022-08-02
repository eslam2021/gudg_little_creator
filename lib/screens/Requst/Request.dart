import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firist_project/modules/home/home.dart';
import 'package:firist_project/screens/Requst/cubit3/cubit3.dart';
import 'package:firist_project/screens/Requst/cubit3/states3.dart';
import 'package:firist_project/shared/Colors.dart';
import 'package:firist_project/shared/components/components.dart';
import 'package:firist_project/shared/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/utils/show_toast.dart';

class Requst extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Requst> {
  var nameController = TextEditingController();
  var nameController1 = TextEditingController();
  var nameController2 = TextEditingController();
  var nameController3 = TextEditingController();
  var ageController = TextEditingController();
  var emailController = TextEditingController();
  var formKey2 = GlobalKey<FormState>();
  String? Value;
  String? Value1;
  String? Value2;
  String? Value3;
  String? Value4;
  String? Value5;
  List<String> items1 = [
    'الفن المسرحي',
    'القصة',
    'الشعر',
    'البرمجة',
    'برمجة المواقع',
    'العزف علي الكمان',
    'العزف علي التشيلو',
    'الرسم',
    'الغناء',
  ];
  List<String> items2 = [
    'حكومي',
    'لغات',
  ];
  List<String> items3 = [
    'ذكر',
    'انثي',
  ];
  List<String> items4 = [
    'من 5 الي 12',
    'من 12 الي 18',
  ];
  List<String> items5 = [
    'رياض اطفال',
    'ابتدائي',
    'اعدادي',
    'ثانوي',
  ];
  List<String> items6 = [
    '1',
    '2',
  ];

  @override
  Widget build(BuildContext context) {
    final requstCubit = BlocProvider.of<RequstCubit>(context);
    return BlocConsumer<RequstCubit, RequstStates>(listener: (context, state) {
      if (state is RequstSuccessState) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      }
      if (state is RequstErrorState) {
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
              key: formKey2,
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
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          defaultFormField(
                            controller: nameController1,
                            label: 'اسم المتقدم بالكامل',
                            prefix: Icons.person,
                            type: TextInputType.text,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'برجاء ادخال الاسم بالكامل';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultFormField(
                            controller: emailController,
                            label: 'البريد الالكتروني',
                            prefix: Icons.email,
                            type: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'البريد الالكتروني لايجب ان تكون فارغه';
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return 'Please a valid Email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultFormField(
                            label: 'العنوان',
                            prefix: Icons.add_location_alt,
                            type: TextInputType.text,
                            controller: nameController,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return ' برجاء ادخال العنوان ';
                              }
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultFormField(
                            label: ' الحساب البنكي',
                            prefix: Icons.credit_card,
                            type: TextInputType.number,
                            controller: nameController2,
                            Maxlength: 16,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return ' برجاء ادخال رقم الحساب ';
                              }
                              if (nameController2.text.length < 16) {
                                return 'رقم الحساب غير صحيح ';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          defaultFormField(
                            label: 'الرقم القومي',
                            prefix: Icons.app_registration_sharp,
                            type: TextInputType.number,
                            controller: nameController3,
                            Maxlength: 14,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return ' برجاء ادخال الرقم القومي ';
                              }
                              if (nameController3.text.length < 14 &&
                                  nameController3.text.length > 14) {
                                return 'الرقم القومي لا يقل 14 رقم';
                              }

                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          defaultFormField(
                            controller: ageController,
                            label: 'العمر',
                            prefix: Icons.date_range,
                            type: TextInputType.number,
                            Maxlength: 2,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'برجاء ادخال عمرك';
                              }
                              final int age = int.parse(ageController.text);
                              if (age >= 18 && age <= 5) {
                                return 'العمر لايقل عن 5 ولا يزيد عن 18';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: kPrimaryColor, width: 3)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: Value3,
                                iconSize: 40,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: kPrimaryColor,
                                ),
                                elevation: 4,
                                isExpanded: true,
                                hint: Center(
                                  child: Text(
                                    '''النوع''',
                                    style: TextStyle(
                                      color: Color(0xff951a49),
                                      fontFamily: 'ElMessiri',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                focusColor: Color5,
                                items: items3.map(buildMenuItem3).toList(),
                                onChanged: (Value3) =>
                                    setState(() => this.Value3 = Value3),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: kPrimaryColor, width: 3)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: Value,
                                iconSize: 40,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: kPrimaryColor,
                                ),
                                elevation: 4,
                                isExpanded: true,
                                hint: Center(
                                  child: Text(
                                    '''المرحلة الدراسية''',
                                    style: TextStyle(
                                      color: Color(0xff951a49),
                                      fontFamily: 'ElMessiri',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                focusColor: Color5,
                                items: items5.map(buildMenuItem5).toList(),
                                onChanged: (Value) =>
                                    setState(() => this.Value = Value),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: kPrimaryColor, width: 3)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: Value4,
                                iconSize: 40,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: kPrimaryColor,
                                ),
                                elevation: 4,
                                isExpanded: true,
                                hint: Center(
                                  child: Text(
                                    '''الفئه العمرية''',
                                    style: TextStyle(
                                      color: Color(0xff951a49),
                                      fontFamily: 'ElMessiri',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                focusColor: Color5,
                                items: items4.map(buildMenuItem4).toList(),
                                onChanged: (Value4) =>
                                    setState(() => this.Value4 = Value4),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: kPrimaryColor, width: 3)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: Value2,
                                iconSize: 40,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: kPrimaryColor,
                                ),
                                elevation: 4,
                                isExpanded: true,
                                hint: Center(
                                  child: Text(
                                    '''النظام التعليمي''',
                                    style: TextStyle(
                                      color: Color(0xff951a49),
                                      fontFamily: 'ElMessiri',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                focusColor: Color5,
                                items: items2.map(buildMenuItem2).toList(),
                                onChanged: (Value2) =>
                                    setState(() => this.Value2 = Value2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: kPrimaryColor, width: 3)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: Value1,
                                iconSize: 40,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: kPrimaryColor,
                                ),
                                elevation: 4,
                                isExpanded: true,
                                hint: Center(
                                  child: Text(
                                    '''نوع المشروع''',
                                    style: TextStyle(
                                      color: Color(0xff951a49),
                                      fontFamily: 'ElMessiri',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                focusColor: Color5,
                                items: items1.map(buildMenuItem1).toList(),
                                onChanged: (Value1) =>
                                    setState(() => this.Value1 = Value1),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: kPrimaryColor, width: 3)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: Value5,
                                iconSize: 40,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: kPrimaryColor,
                                ),
                                elevation: 4,
                                isExpanded: true,
                                hint: Center(
                                  child: Text(
                                    '''عدد المشتركين''',
                                    style: TextStyle(
                                      color: Color(0xff951a49),
                                      fontFamily: 'ElMessiri',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                focusColor: Color5,
                                items: items6.map(buildMenuItem6).toList(),
                                onChanged: (Value5) =>
                                    setState(() => this.Value5 = Value5),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          ConditionalBuilder(
                            condition: !requstCubit.isButtonLoading,
                            builder: (context) => CustomButton(
                              onPressed: () {
                                if (formKey2.currentState!.validate()) {
                                  requstCubit.userRequst(
                                    fullName: nameController1.text,
                                    email: emailController.text,
                                    age: ageController.text,
                                    gender: Value3!,
                                    bankAccount: nameController2.text,
                                    address: nameController.text,
                                    nationalId: nameController3.text,
                                    educational_level: Value!,
                                    educational_system: Value2!,
                                    ageType: Value4!,
                                    compNum: Value5!,
                                    project_type: Value1!,
                                  );
                                }
                              },
                              text: 'التسجيل',
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

  DropdownMenuItem<String> buildMenuItem1(String item1) => DropdownMenuItem(
        value: item1,
        child: Center(
          child: Text(
            item1,
            style: TextStyle(
              color: kPrimaryColor,
              fontFamily: 'ElMessiri',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  DropdownMenuItem<String> buildMenuItem2(String item2) => DropdownMenuItem(
        value: item2,
        child: Center(
          child: Text(
            item2,
            style: TextStyle(
              color: kPrimaryColor,
              fontFamily: 'ElMessiri',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  DropdownMenuItem<String> buildMenuItem3(String item3) => DropdownMenuItem(
        value: item3,
        child: Center(
          child: Text(
            item3,
            style: TextStyle(
              color: kPrimaryColor,
              fontFamily: 'ElMessiri',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  DropdownMenuItem<String> buildMenuItem4(String item4) => DropdownMenuItem(
        value: item4,
        child: Center(
          child: Text(
            item4,
            style: TextStyle(
              color: kPrimaryColor,
              fontFamily: 'ElMessiri',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  DropdownMenuItem<String> buildMenuItem5(String item5) => DropdownMenuItem(
        value: item5,
        child: Center(
          child: Text(
            item5,
            style: TextStyle(
              color: kPrimaryColor,
              fontFamily: 'ElMessiri',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  DropdownMenuItem<String> buildMenuItem6(String item6) => DropdownMenuItem(
        value: item6,
        child: Center(
          child: Text(
            item6,
            style: TextStyle(
              color: kPrimaryColor,
              fontFamily: 'ElMessiri',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}

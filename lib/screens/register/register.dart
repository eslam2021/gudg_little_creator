import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firist_project/screens/register/cubit2/cubit2.dart';
import 'package:firist_project/screens/register/cubit2/states2.dart';
import 'package:firist_project/shared/Colors.dart';
import 'package:firist_project/shared/components/components.dart';
import 'package:firist_project/shared/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/login/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  List<String> items3 = [
    'ذكر',
    'انثي',
  ];
  String? Value3;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var kindController = TextEditingController();
  var phonController = TextEditingController();
  var numberController = TextEditingController();
  var passwordController1 = TextEditingController();
  var ageController = TextEditingController();

  bool isPassword = true;
  bool isPassword1 = true;
  final formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterCubit>(context);
    return BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
      if (state is RegisterSuccessState) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Login()), (route) => false);
      }
    }, builder: (context, state) {
      return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey1,
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
                    height: 10.0,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          defaultFormField(
                            controller: nameController,
                            label: 'الاسم بالكامل',
                            prefix: Icons.person,
                            type: TextInputType.name,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'برجاء ادخال الاسم بالكامل';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
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
                            height: 10.0,
                          ),
                          defaultFormField(
                            controller: passwordController,
                            label: 'كلمةالمرور',
                            prefix: Icons.lock,
                            suffix: isPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onSubmit: (value) {
                              if (formKey1.currentState!.validate()) {
                                registerCubit.userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  confPassword: passwordController1.text,
                                  age: ageController.text,
                                  mobileNumber: phonController.text,
                                  nationalID: numberController.text,
                                  gender: kindController.text,
                                );
                              }
                            },
                            isPassword: isPassword,
                            suffixPressed: () {},
                            type: TextInputType.visiblePassword,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'كلمةالمرور قصيرة';
                              }
                              if (passwordController.text.length <= 8) {
                                return 'كلمةالمرور لا تقل عن 8 حروف';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          defaultFormField(
                            controller: passwordController1,
                            label: 'تاكيد كلمةالمرور',
                            prefix: Icons.lock,
                            suffix: isPassword1
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onSubmit: (value) {
                              if (formKey1.currentState!.validate()) {
                                registerCubit.userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  confPassword: passwordController1.text,
                                  age: ageController.text,
                                  mobileNumber: phonController.text,
                                  nationalID: numberController.text,
                                  gender: kindController.text,
                                );
                              }
                            },
                            isPassword: isPassword1,
                            suffixPressed: () {},
                            type: TextInputType.visiblePassword,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'اعد ادخال كلمةالمرور ';
                              }
                              if (passwordController.text !=
                                  passwordController1.text) {
                                return "كلمة المرور غير متطابقة";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          defaultFormField(
                            controller: numberController,
                            label: 'الرقم القومي',
                            prefix: Icons.credit_card_sharp,
                            type: TextInputType.number,
                            Maxlength: 14,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return ' برجاء ادخال الرقم القومي ';
                              }
                              if (numberController.text.length < 14 &&
                                  numberController.text.length > 14) {
                                return 'الرقم القومي لا يقل 14 رقم';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          defaultFormField(
                            controller: phonController,
                            label: 'رقم الهاتف',
                            prefix: Icons.phone,
                            Maxlength: 11,
                            type: TextInputType.phone,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return ' برجاء ادخال رقم الهاتف ';
                              }
                              if (phonController.text.length < 11 &&
                                  phonController.text.length > 11) {
                                return 'رقم الهاتف لا يقل 11 رقم';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
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
                          SizedBox(height: 10),
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
                            height: 30.0,
                          ),
                          ConditionalBuilder(
                            condition: true,
                            builder: (context) => CustomButton(
                              onPressed: () {
                                if (formKey1.currentState!.validate()) {
                                  registerCubit.userRegister(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    confPassword: passwordController1.text,
                                    age: ageController.text,
                                    mobileNumber: phonController.text,
                                    nationalID: numberController.text,
                                    gender: Value3!,
                                  );
                                }
                              },
                              text: 'التسجيل',
                            ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Login()));
                                  },
                                  child: Text(
                                    'سجل الدخول',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff951a49)),
                                  )),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                ' لديك حساب بالفعل ؟ ',
                                style: TextStyle(
                                  color: Colors.green[500],
                                  fontFamily: 'Amiri',
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
        ),
      );
    });
  }

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
}

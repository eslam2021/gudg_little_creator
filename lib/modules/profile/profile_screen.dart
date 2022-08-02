import 'package:firist_project/modules/profile/componant/body.dart';
import 'package:firist_project/modules/profile/profileApi/cubitProfile/cubitProfile.dart';
import 'package:firist_project/modules/profile/profileApi/cubitProfile/stateProfile.dart';
import 'package:firist_project/shared/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../comp_rate2/comp_rate.dart';
import '../../comp_rate3/comp_rate2.dart';
import '../../layout/Arts.dart';
import '../../layout/Nominations.dart';
import '../../layout/innovation.dart';
import '../../screens/definition/definition.dart';
import '../../screens/winners/winner.dart';
import '../../shared/shared_pref.dart';
import '../home/home.dart';
import '../login/login.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _PoetryState createState() => _PoetryState();
}

void launchWhatsapp({required number, required message}) async {
  String url = "whatsapp://send?phone=$number&text=$message";
  await canLaunch(url) ? launch(url) : print("Can't open whatsapp");
}

class _PoetryState extends State<ProfileScreen> {
  double sideLength = 50;
  bool _isVisible = false;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
                        child:
                            Image.asset("images/logo.png", fit: BoxFit.cover),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Container(
                        height: 40,
                        child: Image.asset("images/scc-logo.png",
                            fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          endDrawer: Drawer(
            child: ListView(
              children: [
                SizedBox(
                  height: 150,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xff951a49),
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'images/sss.jpg',
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          Text(
                            'المبدع الصغير',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'الرئيسية',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontFamily: 'ElMessiri'),
                    textDirection: TextDirection.rtl,
                  ),
                  leading: const Icon(
                    Icons.home,
                    color: kPrimaryColor,
                    textDirection: TextDirection.rtl,
                  ),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false);
                  },
                ),
                ListTile(
                  title: const Text(
                    'اقسام الجائزة',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontFamily: 'ElMessiri'),
                    textDirection: TextDirection.rtl,
                  ),
                  leading: const Icon(
                    Icons.dashboard_rounded,
                    color: kPrimaryColor,
                    textDirection: TextDirection.rtl,
                  ),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => DefinitionScreen()),
                        (route) => false);
                  },
                ),
                ListTile(
                  title: const Text(
                    'الفائزون',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontFamily: 'ElMessiri'),
                    textDirection: TextDirection.rtl,
                  ),
                  leading: const Icon(
                    Icons.wine_bar,
                    color: kPrimaryColor,
                    textDirection: TextDirection.rtl,
                  ),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Winner()),
                        (route) => false);
                  },
                ),
                ListTile(
                  title: const Text(
                    'مجالات الجائزة',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontFamily: 'ElMessiri'),
                    textDirection: TextDirection.rtl,
                  ),
                  leading: const Icon(
                    Icons.view_column_outlined,
                    color: kPrimaryColor,
                    textDirection: TextDirection.rtl,
                  ),
                  onTap: showToast,
                ),
                GestureDetector(
                  child: Visibility(
                    visible: _isVisible,
                    child: const Card(
                      child: ListTile(
                        title: const Text(
                          'الادب',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                              fontFamily: 'ElMessiri'),
                          textDirection: TextDirection.rtl,
                        ),
                        leading: const Icon(
                          Icons.import_contacts,
                          color: kPrimaryColor,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Nominations()),
                        (route) => false);
                  },
                ),
                GestureDetector(
                  child: Visibility(
                    visible: _isVisible,
                    child: const Card(
                      child: ListTile(
                        title: const Text(
                          'الفنون',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                              fontFamily: 'ElMessiri'),
                          textDirection: TextDirection.rtl,
                        ),
                        leading: const Icon(
                          Icons.audiotrack,
                          color: kPrimaryColor,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Arts()),
                        (route) => false);
                  },
                ),
                GestureDetector(
                  child: Visibility(
                    visible: _isVisible,
                    child: const Card(
                      child: ListTile(
                        title: const Text(
                          'الابداع والابتكار',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                              fontFamily: 'ElMessiri'),
                          textDirection: TextDirection.rtl,
                        ),
                        leading: const Icon(
                          Icons.emoji_objects_outlined,
                          color: kPrimaryColor,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Innovation()),
                        (route) => false);
                  },
                ),
                ListTile(
                  title: const Text(
                    'التقييم',style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontFamily: 'ElMessiri'),
                    textDirection: TextDirection.rtl,
                  ),
                  leading: const Icon(
                    Icons.check_circle_outline,
                    color: kPrimaryColor,

                    textDirection: TextDirection.rtl,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (Context) =>  CompRate()),
                    );
                  },
                ),
                ListTile(
                  title: const Text(
                    'النتائج',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontFamily: 'ElMessiri'),
                    textDirection: TextDirection.rtl,
                  ),
                  leading: const Icon(
                    Icons.wine_bar,
                    color: kPrimaryColor,

                    textDirection: TextDirection.rtl,
                  ),
                  onTap: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (Context) => ComppRate( SharedPref.getUserId())),
                    );
                  },
                ),
                ListTile(
                  title: const Text(
                    'صفحتنا علي الفيسبوك',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontFamily: 'ElMessiri'),
                    textDirection: TextDirection.rtl,
                  ),
                  leading: const Icon(
                    Icons.facebook,
                    color: kPrimaryColor,
                    textDirection: TextDirection.rtl,
                  ),
                  onTap: () {
                    launch(
                        'https://www.facebook.com/stateawardforyounginnovator/');
                  },
                ),
                ListTile(
                  title: const Text(
                    'تواصل معنا',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontFamily: 'ElMessiri'),
                    textDirection: TextDirection.rtl,
                  ),
                  leading: const Icon(
                    Icons.whatsapp,
                    color: kPrimaryColor,
                    textDirection: TextDirection.rtl,
                  ),
                  onTap: () {
                    launchWhatsapp(number: "+201559919944 ", message: "Hello");
                  },
                ),
                ListTile(
                  title: const Text(
                    'تسجيل خروج',
                    textDirection: TextDirection.rtl,style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontFamily: 'ElMessiri'),
                  ),
                  leading: const Icon(
                    Icons.logout,
                    color: kPrimaryColor,

                    textDirection: TextDirection.rtl,
                  ),
                  onTap: () {
                    SharedPref().removeUserToken();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (Context) => Login()),
                    );

                  },
                ),
              ],
            ),
          ),
          backgroundColor: kPrimaryColor,
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ProfileCubit.get(context).Profile==null
                  ? const CircularProgressIndicator()
                  : buildText(context,ProfileCubit.get(context).Profile)),
        );
      },
    );
  }

  Widget buildText(BuildContext context, [ProfileModel? Profile]) => SingleChildScrollView(
    child: Column(
      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 10,
        ),
        FlatButton(
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Color5,
              onPressed: () {},
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.person,
                    color: kPrimaryColor,
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      ProfileCubit.get(context).Profile!.name.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                          fontFamily: 'ElMessiri'),
                    ),
                  )
                ],
              ),
            ),
        SizedBox(
          height: 10,
        ),
        FlatButton(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color5,
          onPressed: () {},
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.email,
                color: kPrimaryColor,
                textDirection: TextDirection.rtl,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  ProfileCubit.get(context).Profile!.email.toString(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontFamily: 'ElMessiri'),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        FlatButton(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color5,
          onPressed: () {},
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.call,
                color: kPrimaryColor,
                textDirection: TextDirection.rtl,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  ProfileCubit.get(context).Profile!.mobileNumber.toString(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontFamily: 'ElMessiri'),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        FlatButton(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color5,
          onPressed: () {},
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.credit_card_sharp,
                color: kPrimaryColor,
                textDirection: TextDirection.rtl,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  ProfileCubit.get(context).Profile!.nationalID.toString(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontFamily: 'ElMessiri'),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        FlatButton(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color5,
          onPressed: () {},
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.date_range,
                color: kPrimaryColor,
                textDirection: TextDirection.rtl,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                   ProfileCubit.get(context).Profile!.age.toString(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontFamily: 'ElMessiri'),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        FlatButton(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color5,
          onPressed: () {},
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.male,
                color: kPrimaryColor,
                textDirection: TextDirection.rtl,
              ),
              Icon(
                Icons.female,
                color: kPrimaryColor,
                textDirection: TextDirection.rtl,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  ProfileCubit.get(context).Profile!.gender.toString(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontFamily: 'ElMessiri'),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),

        FlatButton(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color5,
          onPressed: () {
            SharedPref().removeUserToken();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (Context) => Login()));
          },
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.person,
                color: kPrimaryColor,
                textDirection: TextDirection.rtl,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  "LogOut",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontFamily: 'ElMessiri'),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

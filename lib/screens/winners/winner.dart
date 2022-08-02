import 'package:firist_project/layout/Arts.dart';
import 'package:firist_project/layout/innovation.dart';
import 'package:firist_project/modules/profile/profile_screen.dart';
import 'package:firist_project/screens/winners/winner_one.dart';
import 'package:firist_project/screens/winners/winner_tow.dart';
import 'package:firist_project/shared/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../layout/Nominations.dart';
import '../../modules/home/home.dart';
import '../../modules/login/login.dart';


// ignore: camel_case_types, must_be_immutable
class Winner extends StatefulWidget {
  @override
  _WinnerState createState() => _WinnerState();
}
void launchWhatsapp({required number,required message})async{
  String url = "whatsapp://send?phone=$number&text=$message";
  await canLaunch(url) ? launch(url) : print("Can't open whatsapp");
}


class _WinnerState extends State<Winner> {

  bool _isVisible = false;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context){
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

                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);

              },
            ),
            ListTile(
              title: const Text(
                'الصفحة الشخصية',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  fontFamily: 'ElMessiri'),
                textDirection: TextDirection.rtl,
              ),
              leading: const Icon(
                Icons.person,
                color: kPrimaryColor,

                textDirection: TextDirection.rtl,
              ),
              onTap: () {

                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ProfileScreen()), (route) => false);

              },
            ),


            ListTile(
              title: const Text(
                'الاقسام ',style: TextStyle(
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
                      'الادب',style: TextStyle(
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
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Nominations()), (route) => false);

              },
            ),
            GestureDetector(
              child: Visibility(
                visible: _isVisible,
                child: const Card(
                  child: ListTile(
                    title: const Text(
                      'الفنون',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontFamily: 'ElMessiri'),
                      textDirection: TextDirection.rtl,
                    ),
                    leading: const Icon(
                      Icons.audiotrack, color: kPrimaryColor,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Arts()), (route) => false);

              },
            ),
            GestureDetector(
              child: Visibility(
                visible: _isVisible,
                child: const Card(
                  child: ListTile(
                    title: const Text(
                      'الابداع والابتكار',style: TextStyle(
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
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Innovation()), (route) => false);

              },
            ),



            ListTile(
              title: const Text(
                'صفحتنا علي الفيسبوك',style: TextStyle(
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
                launch('https://www.facebook.com/stateawardforyounginnovator/');

              },
            ),
            ListTile(
              title: const Text(
                'تواصل معنا',style: TextStyle(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (Context) => Login()),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: kPrimaryColor,
      body:DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
                constraints: const BoxConstraints.expand(height: 40),
                child: const TabBar(
                  labelColor:kPrimaryColor ,
                  indicatorColor: kPrimaryColor,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
color: Color(0x9ec42e6b),
                  ),
                  tabs: [
                    Tab(
                      child: Center(child: Text('الفئة العمرية الثانية', style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                          fontFamily: 'ElMessiri'),)),
                    ),
                    Tab(
                      child: Center(child: Text('الفئة العمرية الاولى', style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                          fontFamily: 'ElMessiri'),)),
                    ),
                  ],
                ),
              ),
              Expanded(
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: const TabBarView(
                    children: [


                      WinnerTow(),
                      WinnerOne(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



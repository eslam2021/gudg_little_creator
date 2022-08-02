import 'package:firist_project/layout/Arts.dart';
import 'package:firist_project/layout/Project/play.dart';
import 'package:firist_project/layout/Project/story.dart';
import 'package:firist_project/layout/innovation.dart';
import 'package:firist_project/modules/profile/profile_screen.dart';
import 'package:firist_project/screens/definition/definition.dart';
import 'package:firist_project/screens/winners/winner.dart';
import 'package:firist_project/shared/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../comp_rate2/comp_rate.dart';
import '../../comp_rate3/comp_rate2.dart';
import '../../layout/Nominations.dart';
import '../../modules/home/home.dart';
import '../../modules/login/login.dart';
import '../../shared/shared_pref.dart';



// ignore: camel_case_types, must_be_immutable
class DefinitionScreen extends StatefulWidget {
  @override
  _DefinitionScreenState createState() => _DefinitionScreenState();
}
void launchWhatsapp({required number,required message})async{
  String url = "whatsapp://send?phone=$number&text=$message";
  await canLaunch(url) ? launch(url) : print("Can't open whatsapp");
}


class _DefinitionScreenState extends State<DefinitionScreen> {

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
                'الفائزون',style: TextStyle(
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
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Winner()), (route) => false);

              },
            ),
            ListTile(
              title: const Text(
                'مجالات الجائزة ',style: TextStyle(
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
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff951a49),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/def/one.jpeg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              //1---
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff951a49),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/def/2.jpeg',
                          ),
                        ),
                      ),
                    ),
                    Text('البرمجة',
                      style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('شجع البرمجة الأطفال على ممارسة خيالهم والارتجال عندما تكون مواردهم محدودة وتحفيزهم على الإبداع، كما تمنح البرمجة الأطفال شعورا بالإنجاز وتعزز ثقتهم بأنفسهم', style: TextStyle(
                        color: Colors.white,
                      ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 10),
              //2-----
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff951a49),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/def/3.jpeg',
                          ),
                        ),
                      ),
                    ),
                    const Text('الشعر',
                      style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,color: Colors.white,
                      ),
                    ),
                    const Text('كتابة الشعر تثير ملكة التصور مما يغذي ملكة التفكير', style: TextStyle(
                      color: Colors.white,
                    ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
              //3------
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff951a49),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/def/4.jpeg',
                          ),
                        ),
                      ),
                    ),
                    const Text('الابتكارات العلمية',
                      style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('الابتكار هو عملية إنشاء وتنفيذ فكرة جديدة. إنها عملية أخذ الأفكار المفيدة وتحويلها إلى منتجات مفيدة', style: TextStyle(
                        color: Colors.white,
                      ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              //4------
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff951a49),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/def/5.jpeg',
                          ),
                        ),
                      ),
                    ),
                    Text('القصة',
                      style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('القصة من أشد ألوان الأدب تأثيرا في النفوس وخاصة في الأطفال لأنها تتضمن تلك المثيرات الباعثة على تشكيل سلوكهم وتكوين شخصيتهم', style: TextStyle(
                        color: Colors.white,
                      ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              //5------
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff951a49),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/def/6.jpeg',
                          ),
                        ),
                      ),
                    ),
                    const Text('الرسم',
                      style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('أرسم من خيالك أي فكرة تعكس رؤيتك لما تتمنى أن تراه فى المستقبل (الفضاء، أو ما تحب)',
                        textDirection: TextDirection.rtl, style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              //6----
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff951a49),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/def/7.jpeg',
                          ),
                        ),
                      ),
                    ),
                    Text('الكمان',
                      style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('إن آلة الكمان هي آلة غربية دخلت على الموسيقى الشرقية، وتربعت على عرش الموسيقى العربية لصوتها الحنون القادر على ملامسة الروح والأحاسيس',
                        textDirection: TextDirection.rtl, style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //7------
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff951a49),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/def/8.jpeg',
                          ),
                        ),
                      ),
                    ),
                    Text('المسرحية',
                      style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('الطفل القادر على التخيل هو طفل يستطيع أن يجد حلولًا للمشكلات التي تواجهه', style: TextStyle(
                        color: Colors.white,
                      ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //8------
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff951a49),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/def/9.jpeg',
                          ),
                        ),
                      ),
                    ),
                    Text('الغناء',
                      style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('الموسيقى فن إمتزاج الأصوات بهدف التعبير عن المشاعر فى قالب ممتع فهى تملك قدرة على النفاذ إلى أعضائنا و أحاسيسنا تمتزج بها و تؤثر فيها بل و تتحكم فى حالتنا النفسيه و العضويه بأكملها',
                        textDirection: TextDirection.rtl, style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //9---------
            ],
          ),
        ),
      ),
    );
  }
}



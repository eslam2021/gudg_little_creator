import 'package:firist_project/SendProject/Send%20project.dart';
import 'package:firist_project/layout/Arts.dart';
import 'package:firist_project/layout/Nominations.dart';
import 'package:firist_project/layout/innovation.dart';
import 'package:firist_project/modules/profile/profile_screen.dart';
import 'package:firist_project/screens/Requst/Request.dart';
import 'package:firist_project/screens/definition/definition.dart';
import 'package:firist_project/screens/winners/winner.dart';
import 'package:firist_project/shared/Colors.dart';
import 'package:firist_project/shared/shared_pref.dart';
import 'package:firist_project/shared/utils/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../comp_rate2/comp_rate.dart';
import '../../comp_rate3/comp_rate2.dart';
import '../../request.dart';
import '../login/login.dart';



// ignore: camel_case_types, must_be_immutable
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
void launchWhatsapp({required number,required message})async{
  String url = "whatsapp://send?phone=$number&text=$message";
  await canLaunch(url) ? launch(url) : print("Can't open whatsapp");
}


class _HomeScreenState extends State<HomeScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _isVisible = false;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height ;
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
                'الصفحة الشخصية',
                style: TextStyle(
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
                'اقسام الجائزة',style: TextStyle(
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
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => DefinitionScreen()), (route) => false);

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
                ' مجالات الجائزة',style: TextStyle(
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
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [kPrimaryColor, kBackgroundColor],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '''تحت رعاية السيدة الفاضلة''',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color5,
                                  fontFamily: 'ElMessiri'),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '''انتصار السيسي حرم السيد رئيس الجمهورية''',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color5,
                            fontFamily: 'ElMessiri'),
                      ),
                      Text(
                        '''_______________________________''',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color5,
                            fontFamily: 'ElMessiri'),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '''جائزة الدولة للمبدع الصغير''',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color5,
                            fontFamily: 'ElMessiri'),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '''جنيه مصري''',
                            style: TextStyle(
                                fontSize: 10,
                                color: Color5,
                                fontFamily: 'ElMessiri'),
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          Text(
                            '''40,000''',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color5,
                                fontFamily: 'ElMessiri'),
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          Text(
                            '''الدورة الثانيه 2022''',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color5,
                                fontFamily: 'ElMessiri'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '''تخصص الجائزة للمبدعين من الاطفال ''',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color5,
                            fontFamily: 'ElMessiri'),
                      ),
                      Text(
                        '''والنشء من سن 5 الي 18 سنه''',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color5,
                            fontFamily: 'ElMessiri'),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        ''' اخر موعد للإستلام الأعمال 31 مارس 2022م ''',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color5,
                            fontFamily: 'ElMessiri'),
                      ),
                    ],
                  ),],

                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: kPrimaryColor,
                    width: 3,
                  )),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: SizedBox(
                    width: width < height ? width : height ,
                    height: width < height ? height * .3 : width * .3,
                    child: Image.asset('images/4420.gif',fit: BoxFit.cover,),
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: kPrimaryColor,
                    width: 3,
                  )),
              child: ClipRRect(

                borderRadius: BorderRadius.circular(10.0),
                child: Center(
                  child: Container(
                    color: Color5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildText(context),
                        SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: kPrimaryColor,
                    width: 3,
                  )),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Center(
                  child: Container(
                    color: Color5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildText1(context),
                        SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: kPrimaryColor,
                    width: 3,
                  )),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Center(
                  child: Container(
                    color: Color5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildText2(context),
                        SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: kPrimaryColor,
                          width: 2,
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SizedBox(
                        child: Image.asset('images/Draw.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(width: 2),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: kPrimaryColor,
                          width: 3,
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SizedBox(
                        child: Image.asset('images/story.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(width: 2),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: kPrimaryColor,
                          width: 3,
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SizedBox(
                        child: Image.asset('images/theatrical.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(width: 2),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: kPrimaryColor,
                          width: 2,
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SizedBox(
                        child: Image.asset('images/play.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(width: 2),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: kPrimaryColor,
                          width: 3,
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SizedBox(
                        child: Image.asset('images/Poetry.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(width: 2),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: kPrimaryColor,
                          width: 3,
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SizedBox(
                        child: Image.asset('images/program.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(width: 2),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: kPrimaryColor,
                          width: 3,
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SizedBox(
                        child: Image.asset('images/program_app.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(width: 2),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: kPrimaryColor,
                          width: 3,
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SizedBox(
                        child: Image.asset(
                            'images/Scientific_innovations.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(width: 2),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: kPrimaryColor,
                          width: 3,
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SizedBox(
                        child: Image.asset('images/song.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildText(BuildContext context) => ExpansionTile(
        childrenPadding: EdgeInsets.all(16).copyWith(top: 1),
        title: Text(
          '''التعريف بالجائزة''',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
              fontFamily: 'ElMessiri'),
        ),
        children: [
          ReadMoreText(
            '''تعد جائزة الدولة للمبدع الصغير إنجازًا جديدًا للدولة المصرية يجسد التزام الوطن برعاية وتشجيع النشء ويتماشى مع النصوص الدستورية التى تمنح الحق فى الثقافة لكل مواطن كما تكفل حرية الإبداع للنهوض بالفنون والآداب وحماية الإنتاج الثقافى والفنى وتوفير الوسائل اللازمة لتشجيع ذلك. وقد قام فخامة السيد الرئيس عبد الفتاح السيسى بالتصديق على إصدار القانون رقم 204 لسنة 2020 باستحداث جائزة جديدة تحت مسمى «جائزة الدولة للمبدع الصغير»، إذ تمنح هذه الجائزة سنويًا، لمن يُقدم منتجًا فكريًا أو ماديًا مبتكرًا ولم يتجاوز عمره 18 عامًا فى مجالات الثقافة والفنون ومجالات الإبداع والابتكار.''',
            style: TextStyle(
                fontSize: 20, color: kPrimaryColor, fontFamily: 'ElMessiri'),
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'قراءة المزيد',
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            trimExpandedText: 'اقل',
            moreStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
            lessStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
        ],
      );
  Widget buildText1(BuildContext context) => ExpansionTile(
        childrenPadding: EdgeInsets.all(16).copyWith(top: 1),
        title: Text(
          '''أهداف الجائزة''',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
              fontFamily: 'ElMessiri'),
        ),
        children: [
          ReadMoreText(
            '''تهدف الجائزة للاكتشاف المبكر للمواهب الصغيرة وتحفيز الطاقات الإبداعية فى مجالات الثقافة والآداب والفنون والابداع والابتكار، وذلك ضمن الأهداف الإستراتيجية العامة للدولة، والتى تعمل على بناء الإنسان المصرى وترسيخ هويته من خلال خلق آليات مؤسسية تعمل على تشجيع الأطفال على القراءة والكتابة والإبداع والابتكار، لتحقيق الريادة الثقافية لمصر.''',
            style: TextStyle(
                fontSize: 20, color: kPrimaryColor, fontFamily: 'ElMessiri'),
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'قراءة المزيد',
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            trimExpandedText: 'اقل',
            moreStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
            lessStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
        ],
      );

  Widget buildText2(BuildContext context) => ExpansionTile(
        childrenPadding: EdgeInsets.all(16).copyWith(top: 1),
        title: Text(
          '''رعاية الفائزين''',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
              fontFamily: 'ElMessiri'),
        ),
        children: [
          ReadMoreText(
            ''' نص القانون على رعاية الأطفال الفائزين بالجوائز، من خلال مؤسسات الدولة، ويتولى المجلس الأعلى للثقافة رعايتهم لصقل مواهبهم وتنميتها، وهو الهدف الأساسى من صدور قانون الجائزة تشجيعًا للفائزين على الاستمرار في إبداعهم.''',
            style: TextStyle(
                fontSize: 20, color: kPrimaryColor, fontFamily: 'ElMessiri'),
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'قراءة المزيد',
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            trimExpandedText: 'اقل',
            moreStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
            lessStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
        ],
      );
}

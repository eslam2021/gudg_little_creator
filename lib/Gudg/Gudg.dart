import 'dart:developer';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firist_project/Gudg/cubit4/cubit4.dart';
import 'package:firist_project/shared/Colors.dart';
import 'package:firist_project/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../comp_rate2/comp_rate.dart';
import '../comp_rate3/comp_rate2.dart';
import '../layout/Arts.dart';
import '../layout/Nominations.dart';
import '../layout/innovation.dart';
import '../modules/home/home.dart';
import '../modules/login/login.dart';
import '../modules/profile/profile_screen.dart';
import '../screens/definition/definition.dart';
import '../screens/winners/winner.dart';
import '../shared/components/custom_button.dart';
import '../shared/shared_pref.dart';
import '../shared/utils/show_toast.dart';
import 'cubit4/states4.dart';
class Gudg extends StatefulWidget {
  int id;
  Gudg( this.id);

  @override
  _GudgState createState() => _GudgState();
}
class _GudgState extends State<Gudg> {
  var Controller = TextEditingController();
  var Controller1 = TextEditingController();
  var formKey7 = GlobalKey<FormState>();
  bool _isVisible = false;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  void launchWhatsapp({required number,required message})async{
    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunch(url) ? launch(url) : print("Can't open whatsapp");
  }

  String? selectedValue;
  String? Value;
  String? Value1;
  String? Value2;
  String? Value3;
  String? Value4;
  String? Value5;
  String? Value6;
  String? Value7;
  String? Value8;

  List<String> items = [
    'تقليدية',
    'جديدة بسيطة',
    'متميزة',
    'مبدعة',
  ];
  List<String> items6 = [
    'ضعيفة',
    'مقبولة',
    'متميزة',
    'مبدعة',
  ];
  List<String> items1 = [
    'ضعيفة',
    'مقبولة',
    'متميزة',
    'مبدعة',
  ];
  List<String> items8 = [
    'ضعيفة',
    'مقبولة',
    'متميزة',
    'مبدعة',
  ];
  List<String> items5 = [
    'ضعيفة',
    'مقبولة',
    'متميزة',
    'مبدعة',
  ];
  List<String> items2 = [
    'ضعيفة',
    'متوسطة',
    'كبيرة',
    'كبيرة جدا',
  ];
  List<String> items3 = [
    'بسيطة',
    'متوسطة',
    'عالية',
    'متقنة',
  ];
  List<String> items7 = [
    'بسيطة',
    'متوسطة',
    'متميزة',
    'مبدعة',
  ];
  List<String> items4 = [
    'ضعيف',
    'مقبول',
    'جيد',
    'متميز',
    'مبدع',
  ];


  void dropChange(String? val) {}

  @override
  Widget build(BuildContext context) {


    final gudgCubit = BlocProvider.of<GudgCubit>(context);
    return     BlocProvider(
      create: (context) => GudgCubit()..Camp_rate(widget.id.toString()),
      child: BlocConsumer<GudgCubit, GudgStates>(
          listener: (context, state) {
            if (state is GudgSuccessState) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false);
            }
            if (state is GudgErrorState) {
              showStyledToast(context, message: state.error);
            }
          }, builder: (context, state) {
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
        body: Container(
          child: SingleChildScrollView(
            child: Form(
              key: formKey7,
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
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(100))),
                    child: Center(
                      child: CircleAvatar(
                        radius: 80.0,
                        backgroundImage: AssetImage('images/CH.jpg'),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          SizedBox(
                          height: 5.0,
                        ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                              child: SizedBox(
                                height: 45,
                                width: width,
                                  child:GudgCubit.get(context).compRate==null? const CircularProgressIndicator():
                                ElevatedButton(
                                  onPressed: () {
                                    launch('${GudgCubit.get(context).compRate!.driveLink.toString()}');
                                  },
                                  child: Text(' الذهاب للمشروع ',
                                      style: TextStyle(
                                          color: Color5,
                                          fontFamily: 'ElMessiri',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(
                                          Color(0xff951a49)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                            side: BorderSide(
                                              color: Color(0xff951a49),
                                              width: 2.0,
                                            ),
                                          ))),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                          height: 5.0,
                        ),
                          Container(
                           margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color:kPrimaryColor,width: 3 )
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String> (
                                value:Value,
                                iconSize: 40,
                                icon: Icon(Icons.arrow_drop_down,color: kPrimaryColor,),
                                elevation: 4,
                                isExpanded: true,
                                hint: Center(
                                  child: Text(
                                    '''فكرة المشروع''',
                                    style: TextStyle(
                                      color: Color(0xff951a49),
                                      fontFamily: 'ElMessiri',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                           focusColor:Color5 ,
                           items: items.map(buildMenuItem).toList(),
                                onChanged: (Value) => setState(() => this.Value = Value ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color:kPrimaryColor,width: 3 )
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String> (
                                value:Value1,
                                iconSize: 40,
                                icon: Icon(Icons.arrow_drop_down,color: kPrimaryColor,),
                                elevation: 4,
                                isExpanded: true,
                                hint: Center(
                                  child: Text(
                                    '''جودة التنفيذ''',
                                    style: TextStyle(
                                      color: Color(0xff951a49),
                                      fontFamily: 'ElMessiri',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                focusColor:Color5 ,
                                items: items1.map(buildMenuItem1).toList(),
                                onChanged: (Value1) => setState(() => this.Value1 = Value1 ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color:kPrimaryColor,width: 3 )
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String> (
                                value:Value2,
                                iconSize: 40,
                                icon: Icon(Icons.arrow_drop_down,color: kPrimaryColor,),
                                elevation: 4,
                                isExpanded: true,
                                hint: Center(
                                  child: Text(
                                    '''جودة الشكل''',
                                    style: TextStyle(
                                      color: Color(0xff951a49),
                                      fontFamily: 'ElMessiri',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                focusColor:Color5 ,
                                items: items5.map(buildMenuItem2).toList(),
                                onChanged: (Value2) => setState(() => this.Value2 = Value2 ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color:kPrimaryColor,width: 3 )
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String> (
                                value:Value3,
                                iconSize: 40,
                                icon: Icon(Icons.arrow_drop_down,color: kPrimaryColor,),
                                elevation: 4,
                                isExpanded: true,
                                hint: Center(
                                  child: Text(
                                    '''جودة المحتوي''',
                                    style: TextStyle(
                                      color: Color(0xff951a49),
                                      fontFamily: 'ElMessiri',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                focusColor:Color5 ,
                                items: items6.map(buildMenuItem3).toList(),
                                onChanged: (Value3) => setState(() => this.Value3 = Value3 ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color:kPrimaryColor,width: 3 )
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String> (
                                value:Value4,
                                iconSize: 40,
                                icon: Icon(Icons.arrow_drop_down,color: kPrimaryColor,),
                                elevation: 4,
                                isExpanded: true,
                                hint: Center(
                                  child: Text(
                                    '''درجة التعقيد''',
                                    style: TextStyle(
                                      color: Color(0xff951a49),
                                      fontFamily: 'ElMessiri',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                focusColor:Color5 ,
                                items: items3.map(buildMenuItem4).toList(),
                                onChanged: (Value4) => setState(() => this.Value4 = Value4 ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color:kPrimaryColor,width: 3 )
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String> (
                                value:Value5,
                                iconSize: 40,
                                icon: Icon(Icons.arrow_drop_down,color: kPrimaryColor,),
                                elevation: 4,
                                isExpanded: true,
                                hint: Center(
                                  child: Text(
                                    '''فائدة المشروع للاّخرين''',
                                    style: TextStyle(
                                      color: Color(0xff951a49),
                                      fontFamily: 'ElMessiri',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                focusColor:Color5 ,
                                items: items2.map(buildMenuItem5).toList(),
                                onChanged: (Value5) => setState(() => this.Value5 = Value5 ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color:kPrimaryColor,width: 3 )
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String> (
                                value:Value6,
                                iconSize: 40,
                                icon: Icon(Icons.arrow_drop_down,color: kPrimaryColor,),
                                elevation: 4,
                                isExpanded: true,
                                hint: Center(
                                  child: Text(
                                    '''البنية التحتية المستخدمة''',
                                    style: TextStyle(
                                      color: Color(0xff951a49),
                                      fontFamily: 'ElMessiri',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                focusColor:Color5 ,
                                items: items7.map(buildMenuItem6).toList(),
                                onChanged: (Value6) => setState(() => this.Value6 = Value6 ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color:kPrimaryColor,width: 3 )
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String> (
                                value:Value7,
                                iconSize: 40,
                                icon: Icon(Icons.arrow_drop_down,color: kPrimaryColor,),
                                elevation: 4,
                                isExpanded: true,
                                hint: Center(
                                  child: Text(
                                    '''درجة التماسة من الادوات''',
                                    style: TextStyle(
                                      color: Color(0xff951a49),
                                      fontFamily: 'ElMessiri',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                focusColor:Color5 ,
                                items: items8.map(buildMenuItem7).toList(),
                                onChanged: (Value7) => setState(() => this.Value7 = Value7 ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          defaultFormField(
                            controller: Controller,
                            label: ' اللغةوالادوات المستخدمة ',
                            type: TextInputType.text,
                            validate: (String? value) {},
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          defaultFormField(
                            controller: Controller1,
                            label: ' ملاحظات ',
                            type: TextInputType.text,
                            validate: (String? value) {},
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color:kPrimaryColor,width: 3 )
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String> (
                                value:Value8,
                                iconSize: 40,
                                icon: Icon(Icons.arrow_drop_down,color: kPrimaryColor,),
                                elevation: 4,
                                isExpanded: true,
                                hint: Center(
                                  child: Text(
                                    '''التقدير العام''',
                                    style: TextStyle(
                                      color: Color(0xff951a49),
                                      fontFamily: 'ElMessiri',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                focusColor:Color5 ,
                                items: items4.map(buildMenuItem8).toList(),
                                onChanged: (Value8) => setState(() => this.Value8 = Value8),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),

                          ConditionalBuilder(
                            condition: !gudgCubit.isButtonLoading,
                            builder: (context) => CustomButton(
                              onPressed: () {

                                if (formKey7.currentState!.validate()) {
                                  log('send link pressed');
                                  gudgCubit.userGudg(
                                      masteringTheTools: Value7!,
                                      complexity: Value4!,
                                    executionQuality:Value1!,
                                    contentQuality: Value3!,
                                    language_Tools:Controller.text,
                                    notes: Controller1.text,
                                    gui: Value2!,
                                    projectBbenefit: Value5!,
                                    projectIdea:Value!,
                                    overallRating: Value8!,
                                    infrastructureUsed: Value6!,


                                  );
                                }

                              },
                              text: 'حفظ',
                            ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          ),

                          SizedBox(
                            height: 20.0,
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


  }),
    );
}







  DropdownMenuItem<String> buildMenuItem(String item) =>DropdownMenuItem(
    value:item,
    child: Center(
      child: Text(item, style: TextStyle(
        color: kPrimaryColor,
        fontFamily: 'ElMessiri',
        fontSize: 20,
        fontWeight:FontWeight.bold,

      ),),
    ),
  );
  DropdownMenuItem<String> buildMenuItem1(String item1) =>DropdownMenuItem(
    value:item1,
    child: Center(
      child: Text(item1, style: TextStyle(
        color: kPrimaryColor,
        fontFamily: 'ElMessiri',
        fontSize: 20,
        fontWeight:FontWeight.bold,

      ),),
    ),
  );
  DropdownMenuItem<String> buildMenuItem2(String item2) =>DropdownMenuItem(
    value:item2,
    child: Center(
      child: Text(item2, style: TextStyle(
        color: kPrimaryColor,
        fontFamily: 'ElMessiri',
        fontSize: 20,
        fontWeight:FontWeight.bold,

      ),),
    ),
  );
  DropdownMenuItem<String> buildMenuItem3(String item3) =>DropdownMenuItem(
    value:item3,
    child: Center(
      child: Text(item3, style: TextStyle(
        color: kPrimaryColor,
        fontFamily: 'ElMessiri',
        fontSize: 20,
        fontWeight:FontWeight.bold,

      ),),
    ),
  );
  DropdownMenuItem<String> buildMenuItem4(String item4) =>DropdownMenuItem(
    value:item4,
    child: Center(
      child: Text(item4, style: TextStyle(
        color: kPrimaryColor,
        fontFamily: 'ElMessiri',
        fontSize: 20,
        fontWeight:FontWeight.bold,

      ),),
    ),
  );
  DropdownMenuItem<String> buildMenuItem5(String item5) =>DropdownMenuItem(
    value:item5,
    child: Center(
      child: Text(item5, style: TextStyle(
        color: kPrimaryColor,
        fontFamily: 'ElMessiri',
        fontSize: 20,
        fontWeight:FontWeight.bold,

      ),),
    ),
  );
  DropdownMenuItem<String> buildMenuItem6(String item6) =>DropdownMenuItem(
    value:item6,
    child: Center(
      child: Text(item6, style: TextStyle(
        color: kPrimaryColor,
        fontFamily: 'ElMessiri',
        fontSize: 20,
        fontWeight:FontWeight.bold,

      ),),
    ),
  );
  DropdownMenuItem<String> buildMenuItem7(String item7) =>DropdownMenuItem(
    value:item7,
    child: Center(
      child: Text(item7, style: TextStyle(
        color: kPrimaryColor,
        fontFamily: 'ElMessiri',
        fontSize: 20,
        fontWeight:FontWeight.bold,

      ),),
    ),
  );
  DropdownMenuItem<String> buildMenuItem8(String item8) =>DropdownMenuItem(
    value:item8,
    child: Center(
      child: Text(item8, style: TextStyle(
        color: kPrimaryColor,
        fontFamily: 'ElMessiri',
        fontSize: 20,
        fontWeight:FontWeight.bold,

      ),),
    ),
  );


}

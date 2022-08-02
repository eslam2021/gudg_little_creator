import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Gudg/Gudg.dart';
import '../comp_rate2/comp_rate.dart';
import '../layout/Arts.dart';
import '../layout/Nominations.dart';
import '../layout/innovation.dart';
import '../modules/login/login.dart';
import '../modules/profile/profile_screen.dart';
import '../screens/definition/definition.dart';
import '../screens/winners/winner.dart';
import '../shared/Colors.dart';
import '../shared/shared_pref.dart';
import 'cubitt/cubitt2.dart';
import 'cubitt/statee2.dart';


class ComppRate extends StatelessWidget {
   String? id;
   ComppRate(this.id);
   bool _isVisible = false;

   void launchWhatsapp({required number,required message})async{
     String url = "whatsapp://send?phone=$number&text=$message";
     await canLaunch(url) ? launch(url) : print("Can't open whatsapp");
   }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(  
      create: (BuildContext context) =>CompRateeCubit()..Camp_rate(id!),
      child: BlocConsumer<CompRateeCubit, CompRateStates1>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(45.0),
                child: AppBar(
                  elevation: 4,
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
                      onTap: (){},
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
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CompRateeCubit.get(context).CompRatee==null
                      ? const CircularProgressIndicator()
                      : SizedBox(
                    height: height,
                    child: ListView.builder(
                        itemCount:
                        1,
                        itemBuilder: (context, index) {
                          return buildText(context,
                              CompRateeCubit.get(context).CompRatee!);
                        }),
                  ),
                ),
              ));
        },
      ),
    );
  }

  Widget buildText(BuildContext context, [CompRateModel? CompRatee]) => Card(
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
            children: [
              ExpansionTile(
                childrenPadding: EdgeInsets.all(16).copyWith(top: 1),
                title: Center(
                  child: Text(
                    CompRatee!.fullName.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontFamily: 'ElMessiri'),
                  ),
                ),
                children: [
                  Row(
                    children: [
                      Text(
                        'Id:  ',
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                      Text(
                        CompRatee.id.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Name:  ',
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                      Text(
                        CompRatee.fullName.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'e-mail:  ',
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                      Text(
                        CompRatee.email.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'project Idea:  ',
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                      Text(
                        CompRatee.projectIdea.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'gui:  ',
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                      Text(
                        CompRatee.gui.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Execution Quality:  ',
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                      Text(
                        CompRatee.executionQuality.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Content Quality:  ',
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                      Text(
                        CompRatee.contentQuality.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Complexity:  ',
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                      Text(
                        CompRatee.complexity.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Project Benefit:  ',
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                      Text(
                        CompRatee.projectBbenefit.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'language Tools:  ',
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                      Text(
                        CompRatee.languageTools.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Mastering TheTools:  ',
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                      Text(
                        CompRatee.masteringTheTools.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Infra structure Used:  ',
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                      Text(
                        CompRatee.infrastructureUsed.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Notes:  ',
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                      Text(
                        CompRatee.notes.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Overall Rating:  ',
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                      Text(
                        CompRatee.overallRating.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontFamily: 'ElMessiri'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    ),
  );


}

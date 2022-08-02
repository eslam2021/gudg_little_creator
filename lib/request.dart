import 'package:firist_project/Gudg/Gudg.dart';
import 'package:firist_project/shared/Colors.dart';
import 'package:flutter/material.dart';


class Requst2 extends StatefulWidget {
  const Requst2({Key? key}) : super(key: key);

  @override
  _PoetryState createState() => _PoetryState();
}

class _PoetryState extends State<Requst2> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
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
      backgroundColor: kBackgroundColor,

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                      color: Color(0xff2B262D),
                      width: 3,
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Center(
                      child: Container(
                        color: Color(0xffF2EBE5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildText(context),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(Icons.volunteer_activism_sharp,
                                  color: Color(0xff2B262D)),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // body:
      // SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(
      //         height: MediaQuery
      //             .of(context)
      //             .size
      //             .height * 0.35,
      //         decoration: BoxDecoration(
      //           gradient: LinearGradient(
      //             colors: [kPrimaryColor, kBackgroundColor],
      //             end: Alignment.bottomCenter,
      //             begin: Alignment.topCenter,
      //           ),
      //         ),
      //
      //       ),
      //
      //
      //       Padding(
      //         padding: const EdgeInsets.all(6.0),
      //         child: Container(
      //           width: width,
      //           height: 70,
      //           alignment: Alignment.centerLeft,
      //           decoration: BoxDecoration(
      //             border: Border.all(
      //               color: Color(0xffF2EBE5),
      //               width: 3.0,
      //             ),
      //             borderRadius: BorderRadius.circular(20.0),
      //           ),
      //           child: ListTile(
      //             leading: CircleAvatar(
      //               radius: 30.0,
      //               backgroundImage: AssetImage('images/_DSC25411.jpg'),
      //             ),
      //             title: Text('Eslam Mahmoud', textScaleFactor: 1.5,),
      //             trailing: Icon(Icons.arrow_forward_ios_sharp),
      //             onTap:(){
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (Context) =>  Gudg()),
      //               );
      //             },
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
  Widget buildText(BuildContext context) => ExpansionTile(
    childrenPadding: EdgeInsets.all(16).copyWith(top: 1),
    title: Text(
      '''حياته''',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xff2B262D)),
    ),
    children: [

    ],
  );
}

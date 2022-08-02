import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Gudg/Gudg.dart';
import '../shared/Colors.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class CompRate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<CompRateCubit, CompRateStates>(
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
            backgroundColor: kPrimaryColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CompRateCubit.get(context).compRate!.isEmpty
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        height: height,
                        child: ListView.builder(
                            itemCount:
                                CompRateCubit.get(context).compRate!.length,
                            itemBuilder: (context, index) {
                              return buildText(context,
                                  CompRateCubit.get(context).compRate![index]);
                            }),
                      ),
              ),
            ));
      },
    );
  }

  Widget buildText(BuildContext context, [AllComprate? compRate]) => Card(
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
                        compRate!.fullName.toString(),
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
                            compRate.id.toString(),
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
                            compRate.fullName.toString(),
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
                            compRate.email.toString(),
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
                            'Project Type:  ',
                            style: TextStyle(
                                fontSize: 18,
                                color: kPrimaryColor,
                                fontFamily: 'ElMessiri'),
                          ),
                          Text(
                            compRate.projectType.toString(),
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
                            'Age:  ',
                            style: TextStyle(
                                fontSize: 18,
                                color: kPrimaryColor,
                                fontFamily: 'ElMessiri'),
                          ),
                          Text(
                            compRate.age.toString(),
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
                            'Address:  ',
                            style: TextStyle(
                                fontSize: 18,
                                color: kPrimaryColor,
                                fontFamily: 'ElMessiri'),
                          ),
                          Text(
                            compRate.address.toString(),
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
                            'Educational level:  ',
                            style: TextStyle(
                                fontSize: 18,
                                color: kPrimaryColor,
                                fontFamily: 'ElMessiri'),
                          ),
                          Text(
                            compRate.educationalLevel.toString(),
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
                            'Age Type:  ',
                            style: TextStyle(
                                fontSize: 18,
                                color: kPrimaryColor,
                                fontFamily: 'ElMessiri'),
                          ),
                          Text(
                            compRate.ageType.toString(),
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
                            'Educational System:  ',
                            style: TextStyle(
                                fontSize: 18,
                                color: kPrimaryColor,
                                fontFamily: 'ElMessiri'),
                          ),
                          Text(
                            compRate.educationalSystem.toString(),
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: const BorderRadiusDirectional.all(
                            Radius.circular(15)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (Context) => Gudg(compRate.id)),
                          );
                        },
                        child: const Text(
                          'تقييم',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'ElMessiri',
                            fontWeight: FontWeight.bold,
                            color: Color5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

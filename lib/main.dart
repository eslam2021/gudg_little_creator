import 'package:firist_project/Gudg/remote4/dio_helper4.dart';
import 'package:firist_project/SendProject/cubit5/cubit5.dart';
import 'package:firist_project/SendProject/remote5/dio_helper5.dart';
import 'package:firist_project/comp_rate3/cubitt/cubitt2.dart';
import 'package:firist_project/modules/home/home.dart';
import 'package:firist_project/Start.dart';
import 'package:firist_project/modules/login/cubit/cubit.dart';
import 'package:firist_project/modules/profile/profileApi/dio_helper7.dart';
import 'package:firist_project/screens/Requst/cubit3/cubit3.dart';
import 'package:firist_project/screens/register/cubit2/cubit2.dart';
import 'package:firist_project/shared/Colors.dart';
import 'package:firist_project/shared/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Gudg/cubit4/cubit4.dart';
import 'comp_rate2/cubit/cubit.dart';
import 'comp_rate2/dio_helper6.dart';
import 'comp_rate3/dio_helper7.dart';
import 'modules/login/login.dart';
import 'modules/login/remote/dio_helper.dart';
import 'modules/profile/profileApi/cubitProfile/cubitProfile.dart';
import 'screens/Requst/remote3/dio_helper3.dart';
import 'screens/register/remote2/dio_helper2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  DioHelper1.init();
  DioHelper2.init();
  DioHelper3.init();
  DioHelper4.init();
  DioHelper5.init();
  DioHelper6.init();
  DioHelper7.init();
  await SharedPref.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = SharedPref();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => RequstCubit()),
        BlocProvider(create: (context) => SendprojectCubit()),
        BlocProvider(create: (context) => GudgCubit()),
        BlocProvider(create: (context) => CompRateCubit()..Camp_rate()),
        BlocProvider(create: (context) => CompRateeCubit()),
        BlocProvider(create: (context) => ProfileCubit()..getProfile()),
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        theme: ThemeData(
          splashColor: Color(0xff951a49),
          primaryColor: Color(0xff951a49),
          fontFamily: 'ElMessiri',
          scaffoldBackgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Color(0xff951a49),
          ),
          appBarTheme: AppBarTheme(
            color: Color(0xff951a49),
            iconTheme: IconThemeData(color: kPrimaryColor),
            foregroundColor: kPrimaryColor, //here you can give the text color
          ),
        ),
        debugShowCheckedModeBanner: false,
        // home:ProfileScreen()
        home: prefs.isShowIntro()
            ? IntroScreen()
            : prefs.getUserToken().isEmpty
                ? Login()
                : HomeScreen(),
      ),
    );
  }
}

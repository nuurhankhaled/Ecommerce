import 'package:ecommerceproject/scaffolds/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layout/cubit/layoutCubit.dart';
import '../layout/cubit/states.dart';
import '../scaffolds/layoutScreen.dart';
import '../scaffolds/onboarding.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: const  Color.fromRGBO(4, 131, 153 ,1),),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type :BottomNavigationBarType.fixed ,
                selectedItemColor: Color.fromRGBO(4, 131, 153 ,1),
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,)

              ),
// provider , observer
            home:OnBoarding(),
          );
        },
      ),
    );
  }
}
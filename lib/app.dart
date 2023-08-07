
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:org/config/evn.dart';
import 'package:org/infrastucture/theme/bloc/theme_cubit.dart';
import 'package:org/infrastucture/theme/theme_constant.dart';
import 'package:org/ui/Home_Screen/bloc/home_bloc.dart';

import 'infrastucture/routes/name_routes.dart';



class MyApp extends StatelessWidget {
  final String title;
  const MyApp({super.key,required this.title});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeBloc(),),
          BlocProvider(create: (context) => ThemeCubit(),),
        ],
          child: BlocBuilder<ThemeCubit , bool>(
            builder: (context , state){
              return MaterialApp.router(
                title: AppEnvironment.appName,
                debugShowCheckedModeBanner: AppEnvironment.environment == Environment.dev ? false : true,
                routerConfig: NameRoutes.router,
                themeMode: state ? ThemeMode.dark : ThemeMode.light,
                darkTheme: ThemeConstant.darkTheme(context),
                theme: ThemeConstant.lightTheme(context),
                // home: const MyHomePage(title: 'Flutter Demo Home Page'),
              );
            },
          ),
        ),
    );
  }
}


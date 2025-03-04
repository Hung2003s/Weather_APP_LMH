import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherapp/router/router.dart';

import 'bloc/app_bloc/app_bloc.dart';
import 'bloc/language_bloc/language_bloc.dart';
import 'bloc/setting_bloc/settting_bloc.dart';
import 'bloc/visibility_bloc/visibility_unit_bloc.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>( create: (context) => AppBloc(),),
        BlocProvider<TemperatureUnitBloc>( create: (context) => TemperatureUnitBloc()),
        BlocProvider<LanguageBloc>( create: (context) => LanguageBloc()),
        BlocProvider<VisibilityUnitBloc>( create: (context) => VisibilityUnitBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}


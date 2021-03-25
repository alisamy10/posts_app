import 'package:flutter/material.dart';
import 'package:posts_app/di/injector.dart' as di;
import 'bloc/bloc_provider.dart';
import 'bloc/post_bloc.dart';
import 'di/injector.dart';
import 'ui/home.dart';

void main() async {
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<PostBloc>(
        bloc: getIt<PostBloc>(),
        child: Home(),
      ),
    );
  }
}

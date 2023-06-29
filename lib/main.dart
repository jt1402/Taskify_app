import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_models/app_view_model.dart';
import 'package:todo_list/views/login.dart';
import 'package:todo_list/views/register.dart';
import 'package:todo_list/views/settings.dart';
import 'views/task_page.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
      create: (context) => AppViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        "/home": (context) => const TaskPage(),
        "/login": (context) => LoginForm(),
        "/register": (context) => const SignupForm(),
        "/settings": (context) => const SettingsForm(),
      },
    );
  }
}

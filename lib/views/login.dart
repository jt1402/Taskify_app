import 'package:flutter/material.dart';
import 'package:todo_list/common/notifier.dart';
import 'package:todo_list/views/task_page.dart';
import '../common/login_signup_header.dart';
import '../common/text_form_field.dart';
import '../database_helper/database_helper.dart';
import '../models/user_model.dart';
import '../views/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  final _conUserId = TextEditingController();
  final _conPassword = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String uid = _conUserId.text;
    String passwd = _conPassword.text;

    if (uid.isEmpty) {
      showSnackBar(context, "Please Enter User ID");
    } else if (passwd.isEmpty) {
      showSnackBar(context, "Please Enter Password");
    } else {
      await dbHelper.getLoginUser(uid, passwd).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => TaskPage()),
                (Route<dynamic> route) => false);
          });
        } else {
          showSnackBar(context, "Error: User Not Found");
        }
      }).catchError((error) {
        print(error);
        showSnackBar(context, "Error: Login Fail");
      });
    }
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;

    sp.setString("user_id", user.user_id);
    sp.setString("user_name", user.user_name);
    sp.setString("email", user.email);
    sp.setString("password", user.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              genLoginSignupHeader('Login'),
              getTextFormField(
                  controller: _conUserId,
                  icon: Icons.person,
                  hintName: 'User ID'),
              const SizedBox(height: 10.0),
              getTextFormField(
                controller: _conPassword,
                icon: Icons.lock,
                hintName: 'Password',
                isObscureText: true,
              ),
              Container(
                margin: const EdgeInsets.all(25.0),
                width: double.infinity,
                height: 34,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextButton(
                  onPressed: login,
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Does not have account? '),
                  TextButton(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SignupForm()));
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

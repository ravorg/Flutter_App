// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter/material.dart';
import 'package:lista_zakupow/utils/my_colors.dart';
import 'package:lista_zakupow/utils/my_images.dart';
import 'package:lista_zakupow/utils/my_text.dart';
import 'package:lista_zakupow/views/home/home.dart';
import 'package:lista_zakupow/views/rejestracja/rejestracja_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passCon = TextEditingController();

  bool _islogin = false;

  @override
  void initState() {
    super.initState();
    _loadlogin();
  }

  /// Load the initial counter value from persistent storage on start,
  /// or fallback to 0 if it doesn't exist.
  Future<void> _loadlogin() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _islogin = prefs.getBool('login') ?? false;
    });
    if (_islogin == true) {
      // ignore: use_build_context_synchronously
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ),
      );
    }
  }

  /// After a click, increment the counter state and
  /// asynchronously save it to persistent storage.
  Future<void> _savelogin() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _islogin = true;
      prefs.setBool('login', _islogin);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyColors.backColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                width: 250,
                height: 250,
                child: Image.asset(MyImages.imageLogo),
              ),
              Row(
                children: [
                  Text(
                    MyText.loginText,
                    style: TextStyle(
                      color: MyColors.textColor,
                      fontSize: 35,
                      fontFamily: 'JetBrains Mono',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      controller: _emailController,
                      style: TextStyle(
                        color: MyColors.textColor,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Adres Email lub nazwa użytkownika',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: MyColors.textColor,
                          fontFamily: 'JetBrains Mono',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.buttonColor),
                        ),
                        prefixIcon: const Icon(Icons.mail),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value != 'rav') {
                          return 'Błędne dane".';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      controller: _passCon,
                      obscureText: true,
                      style: TextStyle(
                        color: MyColors.textColor,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Hasło',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: MyColors.textColor,
                          fontFamily: 'JetBrains Mono',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.buttonColor),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value != 'rav') {
                          return 'Błędne dane".';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Zapomniałeś hasła?',
                    style: TextStyle(
                      color: MyColors.textColor,
                      fontSize: 15,
                      fontFamily: 'JetBrains Mono',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _savelogin();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomeScreen();
                          },
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.buttonColor,
                    elevation: 0,
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(color: MyColors.basicWhite),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: Text(
                        MyText.registerqText,
                        style: TextStyle(
                          color: MyColors.buttonColor,
                          fontSize: 15,
                          fontFamily: 'JetBrains Mono',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rent_moto/constants/constants.dart';
import 'package:rent_moto/other/widget/app_bar/white_bg_app_bar.dart';
import 'package:rent_moto/other/widget/label.dart';
import 'package:rent_moto/screen/screen.dart';

import '../../firebase/authen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _FormKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  LoginProfile loginprofile = LoginProfile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return WhiteBgAppBar(
      titlePreviousShow: false,
      previousShow: false,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Image.asset("assets/image/logo.png"),
              ),
              Card(
                elevation: 5,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          width: double.infinity,
                          height: 50,
                          color: COLOR_CYAN,
                          alignment: Alignment.center,
                          child: const Label(
                            "เข้าสู่ระบบ",
                            fontSize: FONT_HECTO,
                          )),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: _FormKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: COLOR_GREY,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: _email,
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (String? email) {
                                    loginprofile.email = email;
                                  },
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.email),
                                    labelText: 'Email',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: COLOR_GREY,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: _password,
                                  onSaved: (String? password) {
                                    loginprofile.password = password;
                                  },
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.key),
                                    labelText: 'Password',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignUpScreen()));
                                    },
                                    child: const Label(
                                      "ลงทะเบียน",
                                      decoration: TextDecoration.underline,
                                      decorationColor: COLOR_BLACK,
                                    ),
                                  ),
                                  GestureDetector(
                                    // onTap: () {
                                    //   Navigator.push(
                                    //       context,
                                    //       MaterialPageRoute(
                                    //           builder: (context) =>
                                    //               const HomeScreen()));
                                    // },
                                    onTap: () async {
                                      if (_FormKey.currentState!.validate()) {
                                        _FormKey.currentState!.save();
                                        try {
                                          await FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                                  email: _email.text,
                                                  password: _password.text)
                                              .then((value) {
                                            _FormKey.currentState!.reset();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomeScreen()));
                                          });
                                        } on FirebaseAuthException catch (e) {
                                          print(e.toString());
                                        }
                                      }
                                    },

                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      decoration: BoxDecoration(
                                          color: COLOR_CYAN,
                                          border: Border.all(
                                            color: COLOR_CYAN,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Label(
                                        "เข้าสู่ระบบ",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginProfile {
  String? email;
  String? password;

  LoginProfile({this.email, this.password});
}

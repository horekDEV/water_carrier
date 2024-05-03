// ignore: file_names
import 'package:flutter/material.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _MyRegPageState();
}

class _MyRegPageState extends State<RegPage> {
  String inputPhoneNumber = '';
  String inputSmsCode = '';

  // проверять, совпадает ли код с введенным с кодом из смс
  bool isValidSmsCode() => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF20BCE5),
                Color(0xFF1F62B1),
              ],
            )),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 200),
                      child: Text(
                        'Регистрация',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'lib/fonts/Montserrat-Regular.ttf',
                            fontSize: 36.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: TextField(
                        onSubmitted: (text) => {},
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: 'Номер телефона',
                            hintStyle: const TextStyle(color: Colors.white70),
                            fillColor: const Color(0xFFDE9894),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    width: 0, style: BorderStyle.none)),
                            filled: true),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 40, left: 40, right: 40),
                      child: TextField(
                        onSubmitted: (text) => {},
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: 'Код из смс',
                            hintStyle: const TextStyle(color: Colors.white70),
                            fillColor: const Color(0xFFDE9894),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    width: 0, style: BorderStyle.none)),
                            filled: true),
                      ),
                    ),
                    SizedBox(
                      width: 280,
                      height: 55,
                      child: ElevatedButton(
                          onPressed: () {
                            // if (inputPhoneNumber == '') {
                            //   Fluttertoast.showToast(
                            //       msg: "Вы не ввели номер телефона",
                            //       toastLength: Toast.LENGTH_LONG,
                            //       gravity: ToastGravity.BOTTOM_RIGHT,
                            //       backgroundColor: Colors.white,
                            //       timeInSecForIosWeb: 1,
                            //       textColor: Colors.black,
                            //       fontSize: 14.0);
                            // } else {
                            //   if (inputPhoneNumber.length < 11 ||
                            //       inputPhoneNumber.length > 11) {
                            //     Fluttertoast.cancel();
                            //     Fluttertoast.showToast(
                            //         msg: "Вы не корректно ввели номер телефона",
                            //         toastLength: Toast.LENGTH_LONG,
                            //         gravity: ToastGravity.BOTTOM_RIGHT,
                            //         backgroundColor: Colors.white,
                            //         timeInSecForIosWeb: 1,
                            //         textColor: Colors.black,
                            //         fontSize: 14.0);
                            //   } else {
                            //     if (isValidSmsCode()) {
                            //       Fluttertoast.cancel();
                            //       Fluttertoast.showToast(
                            //           msg:
                            //               "Вы ввели не тот код, попробуйте еще раз",
                            //           toastLength: Toast.LENGTH_SHORT,
                            //           gravity: ToastGravity.BOTTOM_RIGHT,
                            //           backgroundColor: Colors.white,
                            //           timeInSecForIosWeb: 1,
                            //           textColor: Colors.black,
                            //           fontSize: 14.0);
                            //     } else {
                            //       Navigator.of(context).pushNamed('/profile',
                            //           arguments: inputPhoneNumber);
                            //     }
                            //   }
                            // }
                            Navigator.of(context).pushNamed('/profile',
                                arguments: inputPhoneNumber);
                          },
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xFFFA665C))),
                          child: const Text(
                            'Зарегистрироваться',
                            style:
                                TextStyle(color: Colors.white, fontSize: 22.0),
                          )),
                    ),
                  ],
                ))),
      ),
    );
  }
}

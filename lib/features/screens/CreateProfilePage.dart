// ignore: file_names
import 'package:flutter/material.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});

  @override
  State<CreateProfilePage> createState() => _MyCreateProfileState();
}

class _MyCreateProfileState extends State<CreateProfilePage> {
  String inputFio = '';
  String inputeCity = '';
  String? phoneNumber;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      return;
    }

    if (args is! String) {
      return;
    }

    phoneNumber = args;
    super.didChangeDependencies();
  }

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
                      padding: EdgeInsets.only(top: 100),
                      child: Text(
                        'Профиль',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'lib/fonts/Montserrat-Regular.ttf',
                            fontSize: 36.0),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage(
                            'lib/assets/images/profileDefaultPhoto.png'),
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 30, bottom: 30, left: 30),
                      child: TextField(
                        onSubmitted: (text) => {inputFio = text},
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: 'ФИО полностью',
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
                          bottom: 30, left: 30, right: 30),
                      child: TextField(
                        onSubmitted: (text) => {inputeCity = text},
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: 'Выбор города/наслега',
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
                          right: 30, left: 30, bottom: 50),
                      child: TextField(
                        onChanged: (text) {
                          text = phoneNumber!;
                        },
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
                    SizedBox(
                      width: 280,
                      height: 55,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/order');
                          },
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xFFFA665C))),
                          child: const Text(
                            'Сохранить',
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

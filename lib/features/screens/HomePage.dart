// ignore: file_names
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
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
                Color(0xFFFFFFFF),
                Color(0xFF1F62B1),
              ],
            )),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 180),
                      child: Text(
                        'Доставка воды',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily:
                                'lib/fonts/montserrat/Montserrat_Regular.ttf',
                            fontSize: 36.0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(30),
                      child: Image(
                        image: AssetImage('lib/assets/images/logo.png'),
                        width: 300,
                        height: 300,
                      ),
                    ),
                    SizedBox(
                      width: 280,
                      height: 55,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/register');
                          },
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xFFFA665C))),
                          child: const Text(
                            'Начать',
                            style:
                                TextStyle(color: Colors.white, fontSize: 28.0),
                          )),
                    ),
                  ],
                ))),
      ),
    );
  }
}

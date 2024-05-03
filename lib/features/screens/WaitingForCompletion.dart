// ignore: file_names
import 'package:flutter/material.dart';

class WaitingForCompletionPage extends StatefulWidget {
  const WaitingForCompletionPage({super.key});

  @override
  State<WaitingForCompletionPage> createState() =>
      _WaitingForCompletionPageState();
}

class _WaitingForCompletionPageState extends State<WaitingForCompletionPage> {
  String? waterCarrientNumber;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      return;
    }

    if (args is! String) {
      return;
    }

    waterCarrientNumber = args;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff20bce5),
              Color(0xff1f62b1),
            ],
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 250, bottom: 290, right: 30, left: 30),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            alignment: Alignment.center,
            height: 200,
            width: 330,
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text(
                      'ВАШ ЗАКАЗ ПРИНЯТ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        bottom: 10, left: 10, right: 10, top: 45),
                    child: Text(
                      'Информация',
                      style: TextStyle(color: Colors.black, fontSize: 24.0),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    child: Text(
                      'ВОДОВОЗ №$waterCarrientNumber',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

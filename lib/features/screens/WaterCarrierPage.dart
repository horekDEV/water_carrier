// ignore: file_names
import 'package:flutter/material.dart';
import 'package:water_carrier/utils/SideBars.dart';

class WaterCarrierPage extends StatefulWidget {
  const WaterCarrierPage({super.key});

  @override
  State<WaterCarrierPage> createState() => _WaterCarrierPageState();
}

class _WaterCarrierPageState extends State<WaterCarrierPage> {
  final String dataAuto = '';
  final String dataWaterCarrier = '';
  final int capacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            size: 35, //change size on your need
            color: Colors.white, //change color on your need
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        endDrawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    SideBars.waterCarriersTextList[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: SideBars.checkSize(index),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () => SideBars.onClickElement(context, index, true),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Colors.black26,
              ),
              itemCount: 6,
            ),
          ),
        ),
        body: Center(
          child: Container(
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
                padding: const EdgeInsets.only(top: 108),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Image(
                          image: AssetImage(
                              'lib/assets/images/profileWaterCarrient.png')),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 235),
                                child: Text(
                                  'Фото автомобиля',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25)),
                                  width: MediaQuery.of(context).size.width,
                                  height: 47,
                                  child: Center(
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Image(
                                                image: AssetImage(
                                                    'lib/assets/images/photoCamera.png'))),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'Выбрать файл',
                                            style: TextStyle(
                                                color: Color(0xFF2288FF),
                                                backgroundColor:
                                                    Color(0xFFDFDFDF)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 100, left: 20),
                          child: Text(
                            'Данные Свидетельства о регистрации транспорта',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: SizedBox(
                              height: 47,
                              child: TextField(
                                onSubmitted: (text) => {},
                                decoration: InputDecoration(
                                    hintStyle:
                                        const TextStyle(color: Colors.black),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        borderSide: const BorderSide(
                                            width: 0, style: BorderStyle.none)),
                                    filled: true),
                              ),
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 285),
                            child: Text(
                              'Фото СОР',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          SizedBox(
                              child: Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              width: MediaQuery.of(context).size.width,
                              height: 47,
                              child: Center(
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Image(
                                            image: AssetImage(
                                                'lib/assets/images/photoCamera.png'))),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Выбрать файл',
                                        style: TextStyle(
                                            color: Color(0xFF2288FF),
                                            backgroundColor: Color(0xFFDFDFDF)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 100, left: 20),
                            child: Text(
                              'Данные водительского удостоверения',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: SizedBox(
                                height: 47,
                                child: TextField(
                                  onSubmitted: (text) => {},
                                  decoration: InputDecoration(
                                      hintStyle:
                                          const TextStyle(color: Colors.black),
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          borderSide: const BorderSide(
                                              width: 0,
                                              style: BorderStyle.none)),
                                      filled: true),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, right: 10, left: 10),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 295),
                            child: Text(
                              'Фото ВУ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 47,
                                  child: Center(
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Image(
                                                image: AssetImage(
                                                    'lib/assets/images/photoCamera.png'))),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'Выбрать файл',
                                            style: TextStyle(
                                                color: Color(0xFF2288FF),
                                                backgroundColor:
                                                    Color(0xFFDFDFDF)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 300, left: 20),
                            child: Text(
                              'Емкость',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: SizedBox(
                                height: 47,
                                child: TextField(
                                  onSubmitted: (text) => {},
                                  decoration: InputDecoration(
                                      hintStyle:
                                          const TextStyle(color: Colors.black),
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          borderSide: const BorderSide(
                                              width: 0,
                                              style: BorderStyle.none)),
                                      filled: true),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SizedBox(
                        width: 280,
                        height: 55,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/select_water_type');
                            },
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Color(0xFFFA665C))),
                            child: const Text(
                              'Сохранить',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 28.0),
                            )),
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}

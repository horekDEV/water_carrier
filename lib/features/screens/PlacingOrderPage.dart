// ignore: file_names
import 'package:flutter/material.dart';
import 'package:water_carrier/features/types/PaymentType.dart';
import 'package:water_carrier/features/types/WaterType.dart';
import 'package:water_carrier/utils/SideBars.dart';

class PlacingOrderPage extends StatefulWidget {
  const PlacingOrderPage({super.key});

  @override
  State<PlacingOrderPage> createState() => _MyPlacingOrderPageState();
}

class _MyPlacingOrderPageState extends State<PlacingOrderPage> {
  WaterType waterType = WaterType.cleared;
  int count = 1;
  String adress = '';
  PaymentType paymentType = PaymentType.transfer;
  String comment = '';

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
                  SideBars.userTextList[index],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: SideBars.checkSize(index),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () => SideBars.onClickElement(context, index, false),
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
                      padding: EdgeInsets.only(top: 120),
                      child: Text(
                        'Оформление заказа',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'lib/fonts/Montserrat-Regular.ttf',
                            fontSize: 36.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 30, bottom: 20, left: 30, top: 35),
                      child: TextField(
                        onSubmitted: (text) => {},
                        decoration: InputDecoration(
                            hintText: 'Тип воды',
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Image(
                                image: AssetImage(
                                    'lib/assets/images/arrowSelect.png'),
                              ),
                            ),
                            hintStyle: const TextStyle(color: Colors.black45),
                            fillColor: const Color(0xFFEFEFEF),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    width: 0, style: BorderStyle.none)),
                            filled: true),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, left: 30, right: 30),
                      child: TextField(
                        onSubmitted: (text) => {},
                        decoration: InputDecoration(
                            hintText: 'Количество',
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Image(
                                image: AssetImage(
                                    'lib/assets/images/arrowSelect.png'),
                              ),
                            ),
                            hintStyle: const TextStyle(color: Colors.black45),
                            fillColor: const Color(0xFFEFEFEF),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    width: 0, style: BorderStyle.none)),
                            filled: true),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 30, left: 30, bottom: 20),
                      child: TextField(
                        onChanged: (text) {},
                        decoration: InputDecoration(
                            hintText: 'Адрес доставки',
                            hintStyle: const TextStyle(color: Colors.black45),
                            fillColor: const Color(0xFFEFEFEF),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    width: 0, style: BorderStyle.none)),
                            filled: true),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, left: 30, right: 30),
                      child: TextField(
                        onSubmitted: (text) => {},
                        decoration: InputDecoration(
                            hintText: 'Способ оплаты',
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Image(
                                image: AssetImage(
                                    'lib/assets/images/arrowSelect.png'),
                              ),
                            ),
                            hintStyle: const TextStyle(color: Colors.black45),
                            fillColor: const Color(0xFFEFEFEF),
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
                        onChanged: (text) {},
                        decoration: InputDecoration(
                            hintText: 'Комментарий',
                            hintStyle: const TextStyle(color: Colors.black45),
                            fillColor: const Color(0xFFEFEFEF),
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
                            Navigator.of(context).pushNamed('/responses');
                          },
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xFFFA665C))),
                          child: const Text(
                            'Заказать',
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

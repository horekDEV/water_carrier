// ignore: file_names
import 'package:flutter/material.dart';
import 'package:water_carrier/utils/SideBars.dart';

class SelectWaterType extends StatefulWidget {
  const SelectWaterType({super.key});

  @override
  State<SelectWaterType> createState() => _SelectWaterTypeState();
}

class _SelectWaterTypeState extends State<SelectWaterType> {
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
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    width: 330,
                    height: 250,
                    child: const Column(
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage(
                                  'lib/assets/images/profileDefaultPhoto.png'),
                              width: 140,
                              height: 140,
                            ),
                            Text(
                              'ВОДОВОЗ №1',
                              style: TextStyle(fontSize: 22.0),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'Информация',
                            style: TextStyle(
                                color: Colors.black45, fontSize: 18.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 35, left: 35),
                  child: TextField(
                    onSubmitted: (text) => {},
                    decoration: InputDecoration(
                        hintText: 'Выберете тип воды',
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Image(
                            image:
                                AssetImage('lib/assets/images/arrowSelect.png'),
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
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                      width: 250,
                      height: 55,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('/order_for_watter_carriers');
                          },
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xFFFA665C))),
                          child: const Text(
                            'Выйти на линии',
                            style:
                                TextStyle(color: Colors.white, fontSize: 22.0),
                          ))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

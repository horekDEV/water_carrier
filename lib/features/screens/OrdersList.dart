// ignore: file_names
import 'package:flutter/material.dart';
import 'package:water_carrier/utils/SideBars.dart';

class OrdersList extends StatefulWidget {
  const OrdersList({super.key});

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
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
            padding: const EdgeInsets.only(top: 90),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                          'Список заказов',
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 70),
                              child: Text(
                                'на:',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30.0),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF1F62B1),
                                      borderRadius: BorderRadius.circular(15)),
                                  width: 176,
                                  height: 38,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Text(
                                          '01.01.2024',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Image(
                                              image: AssetImage(
                                                  'lib/assets/images/arrowSelect.png')))
                                    ],
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    height: 420,
                    width: 360,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 280,
                      height: 55,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xFFFA665C))),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/order');
                          },
                          child: const Text(
                            'Уйти с линии',
                            style:
                                TextStyle(color: Colors.white, fontSize: 28.0),
                          )),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

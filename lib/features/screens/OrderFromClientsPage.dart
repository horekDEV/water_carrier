// ignore: file_names
import 'package:flutter/material.dart';
import 'package:water_carrier/utils/SideBars.dart';

class OrderFromClientsPage extends StatefulWidget {
  const OrderFromClientsPage({super.key});

  @override
  State<OrderFromClientsPage> createState() => _OrderFromClientsPageState();
}

class _OrderFromClientsPageState extends State<OrderFromClientsPage> {
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
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: ListView.custom(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childrenDelegate: SliverChildListDelegate([
                    _getOrdersWidget(),
                    _getOrdersWidget(),
                    _getOrdersWidget(),
                    _getOrdersWidget(),
                    _getOrdersWidget()
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // отрисовка откликов водовозов
  Widget _getOrdersWidget() {
    return Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 10),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            alignment: Alignment.center,
            height: 148,
            width: 360,
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10, top: 10, left: 10),
                    child: Text(
                      'информация',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    child: Text(
                      'заказчика и заказа',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/orders_list');
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: const Color(0xff379b50),
                            ),
                            child: const Text(
                              'принять',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: const Color(0xff808080),
                            ),
                            child: const Text(
                              'Отклонить',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

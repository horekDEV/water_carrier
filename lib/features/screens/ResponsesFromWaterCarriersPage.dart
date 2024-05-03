// ignore: file_names
import 'package:flutter/material.dart';
import 'package:water_carrier/utils/SideBars.dart';

class ResponsesFromWaterCarriersPage extends StatefulWidget {
  const ResponsesFromWaterCarriersPage({super.key});

  @override
  State<ResponsesFromWaterCarriersPage> createState() =>
      _MyResponsesFromWaterCarriersPageState();
}

class _MyResponsesFromWaterCarriersPageState
    extends State<ResponsesFromWaterCarriersPage> {
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
                    _getResponseWidget(1),
                    _getResponseWidget(2),
                    _getResponseWidget(3),
                    _getResponseWidget(4),
                    _getResponseWidget(5)
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
  Widget _getResponseWidget(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        alignment: Alignment.center,
        height: 160,
        width: 330,
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(right: 10, left: 10, top: 7, bottom: 5),
                child: Text(
                  'информация',
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: Text(
                  'водовоз №$index',
                  style: const TextStyle(color: Colors.black, fontSize: 24.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5, right: 10, left: 10, bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed('/waiting', arguments: index);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: const Color(0xff379b50),
                        ),
                        child: const Text(
                          'принять',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
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
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
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
    );
  }
}

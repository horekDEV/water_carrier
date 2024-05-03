import 'package:flutter/material.dart';

class SideBars {
  static List<String> userTextList = [
    "Профиль",
    "История заказов",
    "Сделать заказ",
    "Стать водовозом",
    "Интегрировать рекламу",
    "Приобрести премиум"
  ];

  static List<String> waterCarriersTextList = [
    "Профиль",
    "Список заказов",
    "Линия",
    "Стать заказчиком",
    "Интегрировать рекламу",
    "Приобрести премиум"
  ];

  static double checkSize(int index) {
    if (index == 0) {
      return 22.0;
    }
    return 18.0;
  }

  static onClickElement(BuildContext context, int index, bool isWaterCarrier) {
    if (index == 1) {
      Navigator.of(context).pushNamed("/responses");
    } else if (index == 2) {
      if (isWaterCarrier) {
        Navigator.of(context).pushNamed("/order_for_watter_carriers");
      } else {
        Navigator.of(context).pushNamed("/order");
      }
    } else if (index == 3) {
      if (isWaterCarrier) {
        Navigator.of(context).pushNamed("/order");
      } else {
        Navigator.of(context).pushNamed("/water_carrier_page");
      }
    } else if (index == 4) {
      Navigator.of(context).pushNamed("/");
    } else if (index == 5) {
      Navigator.of(context).pushNamed("/");
    }
  }
}

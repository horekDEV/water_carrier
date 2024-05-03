// ignore: file_names
import 'package:flutter/material.dart';
import 'package:water_carrier/features/screens/CreateProfilePage.dart';
import 'package:water_carrier/features/screens/HomePage.dart';
import 'package:water_carrier/features/screens/OrderFromClientsPage.dart';
import 'package:water_carrier/features/screens/OrdersList.dart';
import 'package:water_carrier/features/screens/PlacingOrderPage.dart';
import 'package:water_carrier/features/screens/RegPage.dart';
import 'package:water_carrier/features/screens/ResponsesFromWaterCarriersPage.dart';
import 'package:water_carrier/features/screens/SelectWaterType.dart';
import 'package:water_carrier/features/screens/WaitingForCompletion.dart';
import 'package:water_carrier/features/screens/WaterCarrierPage.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Water carrier',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF20BCE5)),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const HomePage(),
          '/register': (context) => const RegPage(),
          '/profile': (context) => const CreateProfilePage(),
          '/order': (context) => const PlacingOrderPage(),
          '/responses': (context) => const ResponsesFromWaterCarriersPage(),
          '/waiting': (context) => const WaitingForCompletionPage(),
          '/water_carrier_page': (context) => const WaterCarrierPage(),
          '/select_water_type': (context) => const SelectWaterType(),
          '/order_for_watter_carriers': (context) =>
              const OrderFromClientsPage(),
          '/orders_list': (context) => const OrdersList()
        });
  }
}

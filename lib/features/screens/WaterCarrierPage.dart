// ignore: file_names
import 'package:flutter/material.dart';
import 'package:water_carrier/utils/SideBars.dart';

class WaterCarrierPage extends StatefulWidget {
  const WaterCarrierPage({super.key});

  @override
  State<WaterCarrierPage> createState() => _WaterCarrierPageState();
}

class _WaterCarrierPageState extends State<WaterCarrierPage>
    with TickerProviderStateMixin {
  final String dataAuto = '';
  final String dataWaterCarrier = '';
  final int capacity = 0;

  late AnimationController _pageAnimationController;
  late AnimationController _floatingActionController;
  late List<AnimationController> _sectionAnimationControllers;
  static const int _sectionCount = 4;

  @override
  void initState() {
    super.initState();
    _pageAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();

    _floatingActionController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat(reverse: true);

    _sectionAnimationControllers = List.generate(
      _sectionCount,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this,
      ),
    );

    for (int i = 0; i < _sectionAnimationControllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
        if (mounted) {
          _sectionAnimationControllers[i].forward();
        }
      });
    }
  }

  @override
  void dispose() {
    _pageAnimationController.dispose();
    _floatingActionController.dispose();
    for (var controller in _sectionAnimationControllers) {
      controller.dispose();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      endDrawer: _buildDrawer(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(
        size: 35,
        color: Colors.white,
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff20bce5), Color(0xff1f62b1)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  SideBars.waterCarriersTextList[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SideBars.checkSize(index),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () => SideBars.onClickElement(context, index, true),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              color: Colors.white30,
            ),
            itemCount: 6,
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff20bce5), Color(0xff1f62b1)],
        ),
      ),
      child: FadeTransition(
        opacity: _pageAnimationController.drive(
          Tween<double>(begin: 0.0, end: 1.0),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 108, bottom: 30),
            child: Column(
              children: [
                // Header Image with scale animation
                ScaleTransition(
                  scale: _pageAnimationController.drive(
                    Tween<double>(begin: 0.8, end: 1.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          )
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: const Image(
                          image: AssetImage(
                              'lib/assets/images/profileWaterCarrient.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                // Form Sections
                _buildAnimatedFormSection(0, 'Фото автомобиля', Icons.directions_car, false, true),
                _buildAnimatedFormSection(1, 'Данные Свидетельства о регистрации транспорта', Icons.description, true, false),
                _buildAnimatedFormSection(2, 'Фото СОР', Icons.image, false, true),
                _buildAnimatedFormSection(3, 'Данные водительского удостоверения', Icons.card_travel, true, false),
                
                // Save Button with floating animation
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ScaleTransition(
                    scale: _floatingActionController.drive(
                      Tween<double>(begin: 0.95, end: 1.05),
                    ),
                    child: _buildAnimatedButton(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedFormSection(
    int index,
    String title,
    IconData icon,
    bool isTextField,
    bool hasFileButton,
  ) {
    return SlideTransition(
      position: _sectionAnimationControllers[index].drive(
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero),
      ),
      child: FadeTransition(
        opacity: _sectionAnimationControllers[index].drive(
          Tween<double>(begin: 0.0, end: 1.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: const CoverageFilter(0.1),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1.5,
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section Header with Icon
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF20BCE5).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              icon,
                              color: const Color(0xFF20BCE5),
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Content
                      if (isTextField) ...[
                        _buildStyledTextField(),
                      ] else if (hasFileButton) ...[
                        _buildFileUploadButton(),
                      ],
                      if (index == 2) ...[
                        const SizedBox(height: 12),
                        _buildFileUploadButton(),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStyledTextField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          hintText: 'Введите данные...',
          hintStyle: TextStyle(color: Colors.grey[400]),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.blue.withOpacity(0.3),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.blue.withOpacity(0.2),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color(0xFF20BCE5),
              width: 2,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.check_circle_outline,
                color: Colors.green.withOpacity(0.5)),
          ),
        ),
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }

  Widget _buildFileUploadButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color(0xFF20BCE5).withOpacity(0.3),
              width: 2,
            ),
            color: const Color(0xFF20BCE5).withOpacity(0.08),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF20BCE5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.photo_camera,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Выбрать файл',
                style: TextStyle(
                  color: Color(0xFF20BCE5),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/select_water_type');
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFA665C).withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/select_water_type');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFA665C),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Сохранить',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(width: 10),
                Transform.translate(
                  offset: Offset(0, _floatingActionController.value * 3),
                  child: const Icon(Icons.arrow_forward, size: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


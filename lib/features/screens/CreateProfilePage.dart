// ignore: file_names
import 'package:flutter/material.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});

  @override
  State<CreateProfilePage> createState() => _MyCreateProfileState();
}

class _MyCreateProfileState extends State<CreateProfilePage> with TickerProviderStateMixin {
  String inputFio = '';
  String inputeCity = '';
  String? phoneNumber;

  late AnimationController _pageAnimationController;
  late AnimationController _profilePhotoController;
  late List<AnimationController> _fieldAnimationControllers;
  static const int _fieldCount = 3;

  @override
  void initState() {
    super.initState();
    _pageAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();

    _profilePhotoController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();

    _fieldAnimationControllers = List.generate(
      _fieldCount,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      ),
    );

    for (int i = 0; i < _fieldAnimationControllers.length; i++) {
      Future.delayed(Duration(milliseconds: 300 + i * 150), () {
        if (mounted) {
          _fieldAnimationControllers[i].forward();
        }
      });
    }
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      return;
    }

    if (args is! String) {
      return;
    }

    phoneNumber = args;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _pageAnimationController.dispose();
    _profilePhotoController.dispose();
    for (var controller in _fieldAnimationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF20BCE5),
              Color(0xFF1F62B1),
            ],
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // Header with title
              FadeTransition(
                opacity: _pageAnimationController.drive(
                  Tween<double>(begin: 0.0, end: 1.0),
                ),
                child: SlideTransition(
                  position: _pageAnimationController.drive(
                    Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80, bottom: 40),
                    child: Column(
                      children: [
                        const Text(
                          'Создание профиля',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Заполните данные для вашего профиля',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Profile Photo with animation
              ScaleTransition(
                scale: _profilePhotoController.drive(
                  Tween<double>(begin: 0.5, end: 1.0),
                ),
                child: FadeTransition(
                  opacity: _profilePhotoController.drive(
                    Tween<double>(begin: 0.0, end: 1.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          )
                        ],
                      ),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.5),
                                width: 3,
                              ),
                            ),
                            child: const ClipOval(
                              child: Image(
                                image: AssetImage(
                                    'lib/assets/images/profileDefaultPhoto.png'),
                                width: 180,
                                height: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Form Fields with staggered animations
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildAnimatedFormField(
                      0,
                      'ФИО полностью',
                      Icons.person,
                      (text) => inputFio = text,
                    ),
                    const SizedBox(height: 16),
                    _buildAnimatedFormField(
                      1,
                      'Выбор города/наслега',
                      Icons.location_city,
                      (text) => inputeCity = text,
                    ),
                    const SizedBox(height: 16),
                    _buildAnimatedFormField(
                      2,
                      'Номер телефона',
                      Icons.phone,
                      (text) => phoneNumber = text,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // Save Button with animation
              ScaleTransition(
                scale: _fieldAnimationControllers[_fieldCount - 1].drive(
                  Tween<double>(begin: 0.0, end: 1.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFA665C).withOpacity(0.4),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        )
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/order');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFA665C),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 18,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Сохранить',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.check_circle_outline, size: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedFormField(
    int index,
    String hintText,
    IconData icon,
    Function(String) onChanged,
  ) {
    return SlideTransition(
      position: _fieldAnimationControllers[index].drive(
        Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero),
      ),
      child: FadeTransition(
        opacity: _fieldAnimationControllers[index].drive(
          Tween<double>(begin: 0.0, end: 1.0),
        ),
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
          child: TextField(
            onChanged: onChanged,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.white70),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              fillColor: const Color(0xFFDE9894),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 16, right: 12),
                child: Icon(icon, color: Colors.white, size: 22),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 50,
                minHeight: 50,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  color: Colors.white.withOpacity(0.2),
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              filled: true,
            ),
          ),
        ),
      ),
    );
  }
}

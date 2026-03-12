// ignore: file_names
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _titleAnimationController;
  late AnimationController _logoAnimationController;
  late AnimationController _buttonAnimationController;

  @override
  void initState() {
    super.initState();
    _titleAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();

    _logoAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat(reverse: true);

    _buttonAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) {
        _buttonAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _titleAnimationController.dispose();
    _logoAnimationController.dispose();
    _buttonAnimationController.dispose();
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Title
                SlideTransition(
                  position: _titleAnimationController.drive(
                    Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero),
                  ),
                  child: FadeTransition(
                    opacity: _titleAnimationController.drive(
                      Tween<double>(begin: 0.0, end: 1.0),
                    ),
                    child: const Text(
                      'Доставка воды',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Subtitle with animation
                FadeTransition(
                  opacity: _titleAnimationController.drive(
                    Tween<double>(begin: 0.0, end: 0.7),
                  ),
                  child: const Text(
                    'Качественная доставка к дверям вашего дома',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16.0,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                
                const SizedBox(height: 60),

                // Animated Logo
                ScaleTransition(
                  scale: _logoAnimationController.drive(
                    Tween<double>(begin: 0.95, end: 1.05),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 30,
                          offset: const Offset(0, 15),
                        )
                      ],
                    ),
                    child: const Image(
                      image: AssetImage('lib/assets/images/logo.png'),
                      width: 250,
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const SizedBox(height: 80),

                // Animated Button
                ScaleTransition(
                  scale: _buttonAnimationController.drive(
                    Tween<double>(begin: 0.0, end: 1.0),
                  ),
                  child: FadeTransition(
                    opacity: _buttonAnimationController.drive(
                      Tween<double>(begin: 0.0, end: 1.0),
                    ),
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
                          Navigator.of(context).pushNamed('/register');
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
                          children: [
                            const Text(
                              'Начать',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.arrow_forward, size: 22),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

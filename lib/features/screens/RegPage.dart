// ignore: file_names
import 'package:flutter/material.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _MyRegPageState();
}

class _MyRegPageState extends State<RegPage> with TickerProviderStateMixin {
  String inputPhoneNumber = '';
  String inputSmsCode = '';

  late AnimationController _pageAnimationController;
  late AnimationController _smsSendController;
  late List<AnimationController> _fieldAnimationControllers;
  bool _showSmsField = false;
  static const int _fieldCount = 2;

  // проверять, совпадает ли код с введенным с кодом из смс
  bool isValidSmsCode() => true;

  @override
  void initState() {
    super.initState();
    _pageAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();

    _smsSendController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fieldAnimationControllers = List.generate(
      _fieldCount,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      ),
    );

    _fieldAnimationControllers[0].forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _fieldAnimationControllers[1].forward();
      }
    });
  }

  @override
  void dispose() {
    _pageAnimationController.dispose();
    _smsSendController.dispose();
    for (var controller in _fieldAnimationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _sendSms() {
    if (inputPhoneNumber.isNotEmpty) {
      setState(() => _showSmsField = true);
      _smsSendController.forward();
    }
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
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Header with animation
                FadeTransition(
                  opacity: _pageAnimationController.drive(
                    Tween<double>(begin: 0.0, end: 1.0),
                  ),
                  child: SlideTransition(
                    position: _pageAnimationController.drive(
                      Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Регистрация',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Введите номер телефона для входа',
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

                const SizedBox(height: 60),

                // Phone Number Field
                SlideTransition(
                  position: _fieldAnimationControllers[0].drive(
                    Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero),
                  ),
                  child: FadeTransition(
                    opacity: _fieldAnimationControllers[0].drive(
                      Tween<double>(begin: 0.0, end: 1.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: _buildFormField(
                        'Номер телефона',
                        Icons.phone,
                        (text) {
                          inputPhoneNumber = text;
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // SMS Code Field (shown after phone is entered)
                if (_showSmsField) ...[
                  SlideTransition(
                    position: _smsSendController.drive(
                      Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero),
                    ),
                    child: FadeTransition(
                      opacity: _smsSendController.drive(
                        Tween<double>(begin: 0.0, end: 1.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: _buildFormField(
                          'Код из смс',
                          Icons.security,
                          (text) {
                            inputSmsCode = text;
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Resend SMS Link
                  ScaleTransition(
                    scale: _smsSendController.drive(
                      Tween<double>(begin: 0.0, end: 1.0),
                    ),
                    child: TextButton(
                      onPressed: _sendSms,
                      child: const Text(
                        'Отправить код снова',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13.0,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ] else
                  const SizedBox(height: 40),

                const SizedBox(height: 40),

                // Button (Send SMS or Complete Registration)
                ScaleTransition(
                  scale: _fieldAnimationControllers[1].drive(
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
                        if (!_showSmsField) {
                          _sendSms();
                        } else {
                          Navigator.of(context).pushNamed(
                            '/profile',
                            arguments: inputPhoneNumber,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFA665C),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _showSmsField ? 'Зарегистрироваться' : 'Отправить код',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            _showSmsField ? Icons.check_circle_outline : Icons.arrow_forward,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(
    String hintText,
    IconData icon,
    Function(String) onChanged,
  ) {
    return Container(
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
    );
  }
}

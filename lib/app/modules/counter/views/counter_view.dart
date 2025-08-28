import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  CounterView({Key? key}) : super(key: key);
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Counter Futuristik",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Efek lingkaran neon di background
              Positioned(
                top: -100,
                left: -100,
                child: _neonCircle(200, Colors.blueAccent),
              ),
              Positioned(
                bottom: -120,
                right: -100,
                child: _neonCircle(250, Colors.purpleAccent),
              ),

              // Angka Counter dengan animasi
              Obx(() => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 600),
                    transitionBuilder: (child, anim) => ScaleTransition(
                      scale: CurvedAnimation(
                        parent: anim,
                        curve: Curves.elasticOut,
                      ),
                      child: FadeTransition(opacity: anim, child: child),
                    ),
                    child: Text(
                      "${controller.hitung.value}",
                      key: ValueKey<int>(controller.hitung.value),
                      style: TextStyle(
                        fontSize: 140,
                        fontWeight: FontWeight.w900,
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: [Color(0xFF38BDF8), Color(0xFFA78BFA)],
                          ).createShader(
                            const Rect.fromLTWH(0, 0, 300, 100),
                          ),
                        shadows: [
                          Shadow(
                            blurRadius: 30,
                            color: Colors.black.withOpacity(0.8),
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                    ),
                  )),

              // Tombol futuristik
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _glassButton(
                              icon: Icons.remove,
                              color: Colors.redAccent,
                              onTap: controller.decrement,
                            ),
                            const SizedBox(width: 40),
                            _glassButton(
                              icon: Icons.add,
                              color: Colors.greenAccent,
                              onTap: controller.increment,
                            ),
                          ],
                        ),
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

  // Neon lingkaran glow
  Widget _neonCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withOpacity(0.6),
            color.withOpacity(0.0),
          ],
        ),
      ),
    );
  }

  // Tombol transparan kaca + glow
  Widget _glassButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.1),
          border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.6),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Icon(icon, color: color, size: 34),
      ),
    );
  }
}

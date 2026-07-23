import 'package:apptule/login/login_screem.dart';
import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateToLogin();
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _navigateToLogin() {
    if (!mounted) return;

    // Transición a la pantalla de Login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginScreem()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primaryBackground, Color(0xFF3B4A32)],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              // 1. Iconos de ganado
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('🐂', style: TextStyle(fontSize: 24)),
                  SizedBox(width: 8),
                  Text('🐄', style: TextStyle(fontSize: 24)),
                  SizedBox(width: 8),
                  Text('🐑', style: TextStyle(fontSize: 24)),
                ],
              ),
              const SizedBox(height: 16),

              // 2. Logo TULE
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'TULE',
                    style: TextStyle(
                      fontFamily: 'Serif',
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: AppColors.creamColor,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(width: 12),
                  Icon(Icons.agriculture, size: 42, color: Color(0xFFF1E7D5)),
                ],
              ),
              const SizedBox(height: 8),

              // Subtítulo
              const Text(
                'Gestión Ganadera Inteligente',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.creamColor,
                  letterSpacing: 1.1,
                ),
              ),

              const Spacer(flex: 1),

              // 3. Ilustración Central
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.lightGreen, width: 2),
                  color: AppColors.creamColor.withValues(alpha: 0.1),
                ),
                child: const Center(
                  child: Text('🏞️', style: TextStyle(fontSize: 64)),
                ),
              ),

              const Spacer(flex: 1),

              // 4. Barra de Carga Real (10 Segundos)
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cargando...',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.lightGreen,
                              ),
                            ),
                            // Muestra el porcentaje de progreso actual
                            Text(
                              '${(_animationController.value * 100).toInt()}%',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.lightGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: _animationController.value,
                            backgroundColor: AppColors.creamColor.withValues(
                              alpha: 0.2,
                            ),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.lightGreen,
                            ),
                            minHeight: 6,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

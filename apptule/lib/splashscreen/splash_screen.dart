/*import 'package:flutter/material.dart';

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
      MaterialPageRoute(builder: (_) => SplashScreen()),
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
}*/

import 'package:apptule/config/app_colors.dart';
import 'package:apptule/splashscreen/SplashCustom.dart';
import 'package:flutter/material.dart';
import 'package:apptule/login/login_screem.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Duración recomendada para UX fluida (2.2 segundos)
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
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

    // Transición suave hacia el Login
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (_, animation, __) => const LoginScreem(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgColor,
      body: Stack(
        children: [
          // 1. Textura de puntos idéntica al Login
          Positioned.fill(
            child: CustomPaint(
              painter: const SplashDotGridPainter(
                dotColor: Color(0xFF1C2B0E),
                spacing: 13.0,
                radius: 1.1,
              ),
            ),
          ),

          // 2. Silueta de paisaje en la base
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 90,
            child: CustomPaint(
              painter: const SplashHillsPainter(hillColor: Color(0xFF2C3917)),
            ),
          ),

          // 3. Contenido Principal
          SafeArea(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 3),

                      // Isotipo oficial: 3 cabezas doradas
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.0,
                            ),
                            child: CustomPaint(
                              size: const Size(22, 22),
                              painter: const SplashCattleHeadPainter(
                                color: AppColors.goldenAccent,
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 10),

                      // Nombre TULE
                      const Text(
                        'TULE',
                        style: TextStyle(
                          fontFamily: 'serif',
                          fontSize: 54,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 8.0,
                          color: AppColors.primaryCream,
                          height: 1.05,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // 3. Ilustración Central
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.lightGreen,
                            width: 2,
                          ),
                          color: AppColors.creamColor.withValues(alpha: 0.1),
                        ),
                        child: const Center(
                          child: Text('🏞️', style: TextStyle(fontSize: 64)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Tagline
                      const Text(
                        'Gestión Ganadera Inteligente',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'sans-serif',
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.3,
                          color: Colors.white,
                        ),
                      ),

                      const Spacer(flex: 3),

                      // Barra de Carga estilizada
                      AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, _) {
                          final percentage = (_animationController.value * 100)
                              .toInt();
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Iniciando sistema...',
                                    style: TextStyle(
                                      fontFamily: 'sans-serif',
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.subtitleColor,
                                    ),
                                  ),
                                  Text(
                                    '$percentage%',
                                    style: const TextStyle(
                                      fontFamily: 'sans-serif',
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.goldenAccent,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 5,
                                  color: const Color(0xFF1A280D),
                                  child: LinearProgressIndicator(
                                    value: _animationController.value,
                                    backgroundColor: Colors.transparent,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          AppColors.primaryCream,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      const SizedBox(height: 36),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:apptule/config/app_colors.dart';
import 'package:apptule/login/custom.dart';
import 'package:apptule/menu/home.dart';
import 'package:apptule/register/register.dart';
import 'package:flutter/material.dart';

class LoginScreem extends StatefulWidget {
  const LoginScreem({super.key});

  @override
  State<LoginScreem> createState() => _LoginScreemState();
}

class _LoginScreemState extends State<LoginScreem> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'tu@correo.com');
  final _passwordController = TextEditingController();

  bool _rememberMe = false;
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLoguin() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() => _isLoading = false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sesión iniciada con éxito'),
              backgroundColor: Color(0xFF1E350E),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgColor,
      body: Stack(
        children: [
          // 1. Matriz de micro-puntos de fondo
          Positioned.fill(child: CustomPaint(painter: const DotGridPainter())),

          // 2. Silueta de relieve en la parte inferior
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 76,
            child: CustomPaint(painter: const HillSilhouettePainter()),
          ),

          // 3. Formulario principal
          SafeArea(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28.0,
                  vertical: 10.0,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),

                      // --- LOGO Y MARCA ---
                      Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ...List.generate(3, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0,
                                    ),
                                    child: CustomPaint(
                                      size: const Size(18, 18),
                                      painter: const CattleHeadIconPainter(
                                        color: AppColors.goldenAccent,
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'TULE',
                              style: TextStyle(
                                fontFamily: 'serif',
                                fontSize: 48,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 7.0,
                                color: AppColors.primaryCream,
                                height: 1.05,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Gestión Ganadera Inteligente',
                              style: TextStyle(
                                fontFamily: 'sans-serif',
                                fontSize: 14.5,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.2,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),

                      // --- TÍTULO ---
                      const Text(
                        'Bienvenido de nuevo',
                        style: TextStyle(
                          fontFamily: 'serif',
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryCream,
                        ),
                      ),

                      const SizedBox(height: 10),
                      // --- SUBTÍTULO ---
                      const Text(
                        'Administra tu operación ganadera desde un solo lugar.',
                        style: TextStyle(
                          fontFamily: 'sans-serif',
                          fontSize: 14.5,
                          fontWeight: FontWeight.w400,
                          color: AppColors.subtitleColor,
                          height: 1.35,
                        ),
                      ),

                      const SizedBox(height: 28),

                      // --- INPUT: CORREO ELECTRÓNICO ---
                      const Text(
                        'Correo electrónico',
                        style: TextStyle(
                          fontFamily: 'sans-serif',
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryCream,
                        ),
                      ),
                      const SizedBox(height: 8),

                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.5,
                          fontFamily: 'sans-serif',
                        ),
                        decoration: InputDecoration(
                          hintText: 'tu@correo.com',
                          hintStyle: const TextStyle(
                            color: Color(0xFF6B7F56),
                            fontSize: 14.5,
                          ),
                          filled: true,
                          fillColor: AppColors.inputFillColor,
                          prefixIcon: const Icon(
                            Icons.mail_outline_rounded,
                            color: AppColors.goldenAccent,
                            size: 20,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 16.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(
                              color: AppColors.inputBorderColor,
                              width: 1.2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(
                              color: AppColors.goldenAccent,
                              width: 1.4,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      // --- INPUT: CONTRASEÑA ---
                      const Text(
                        'Contraseña',
                        style: TextStyle(
                          fontFamily: 'sans-serif',
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryCream,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.5,
                          fontFamily: 'sans-serif',
                        ),
                        decoration: InputDecoration(
                          hintText: 'Ingresa tu contraseña',
                          hintStyle: const TextStyle(
                            color: Color(0xFF6B7F56),
                            fontSize: 14.5,
                          ),
                          filled: true,
                          fillColor: AppColors.inputFillColor,
                          prefixIcon: const Icon(
                            Icons.lock_outline_rounded,
                            color: AppColors.goldenAccent,
                            size: 20,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: AppColors.goldenAccent,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 16.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(
                              color: AppColors.inputBorderColor,
                              width: 1.2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(
                              color: AppColors.goldenAccent,
                              width: 1.4,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),
                      // --- RECORDARME & OLVIDASTE CONTRASEÑA ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() => _rememberMe = !_rememberMe);
                            },
                            child: (Row(
                              children: [
                                Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    color: _rememberMe
                                        ? AppColors.goldenAccent
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: _rememberMe
                                          ? AppColors.goldenAccent
                                          : const Color(0xFF909A7A),
                                      width: 1.4,
                                    ),
                                  ),
                                  child: _rememberMe
                                      ? const Icon(
                                          Icons.check,
                                          size: 14,
                                          color: AppColors.darkButtonText,
                                        )
                                      : null,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Recordarme',
                                  style: TextStyle(
                                    fontFamily: 'sans-serif',
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.subtitleColor,
                                  ),
                                ),
                              ],
                            )),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              '¿Olvidaste tu contraseña?',
                              style: TextStyle(
                                fontFamily: 'sans-serif',
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.goldenAccent,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.goldenAccent
                                    .withValues(alpha: 0.5),
                                decorationThickness: 1,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 26),
                      // --- BOTÓN PRINCIPAL ---
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: _isLoading
                              ? null
                              : () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryCream,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          child: _isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.2,
                                    color: AppColors.darkButtonText,
                                  ),
                                )
                              : const Text(
                                  'Iniciar sesión',
                                  style: TextStyle(
                                    fontFamily: 'sans-serif',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.darkButtonText,
                                  ),
                                ),
                        ),
                      ),

                      const SizedBox(height: 25),
                      // --- SEPARADOR O CONTINÚA CON ---
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 0.9,
                              color: const Color(0xFF2B3A1C),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14.0,
                            ),
                            child: Text(
                              'o continúa con',
                              style: TextStyle(
                                fontFamily: 'sans-serif',
                                fontSize: 13.0,
                                color: AppColors.subtitleColor.withValues(
                                  alpha: 0.75,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 0.9,
                              color: const Color(0xFF2B3A1C),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),
                      // --- BOTÓN GOOGLE CORREGIDO (FULL WIDTH Y CENTRADO) ---
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {
                            // Autenticación con Google
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.primaryCream.withValues(
                              alpha: 0.4,
                            ),
                            side: BorderSide(
                              color: Color(0xFF334520),
                              width: 1.2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.goldenAccent,
                                    width: 1.4,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'G',
                                  style: TextStyle(
                                    color: AppColors.goldenAccent,
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'sans-serif',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Continuar con Google',
                                style: TextStyle(
                                  fontFamily: 'sans-serif',
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryCream,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),
                      // --- ENLACE A REGISTRO ---
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontFamily: 'sans-serif',
                                fontSize: 13.5,
                                color: AppColors.subtitleColor,
                              ),
                              children: [
                                TextSpan(text: '¿Aún no tienes una cuenta? '),
                                TextSpan(
                                  text: 'Regístrate',
                                  style: TextStyle(
                                    color: AppColors.goldenAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
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

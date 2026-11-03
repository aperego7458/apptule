import 'package:apptule/config/app_colors.dart';
import 'package:apptule/register/custom_register.dart';
import 'package:apptule/register/label_register.dart';
import 'package:flutter/material.dart';

/// Modelo de datos para las fincas
class FincaOption {
  final String nombre;
  final String ubicacion;
  final IconData icon;

  const FincaOption({
    required this.nombre,
    required this.ubicacion,
    this.icon = Icons.landscape_rounded,
  });
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  // Controladores de texto
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Estados
  bool _obscurePassword = true;
  bool _aceptaTerminos = false;
  bool _isLoading = false;

  // Factor 1: Fincas con ubicación
  final List<FincaOption> _fincas = const [
    FincaOption(
      nombre: 'Villapaulina',
      ubicacion: 'Fredonia, Ant',
      icon: Icons.terrain_rounded,
    ),
    FincaOption(
      nombre: 'Tule',
      ubicacion: 'Chigorodó, Ant',
      icon: Icons.agriculture_rounded,
    ),
  ];
  FincaOption? _selectedFinca;

  // Factor 2: Cargos de la operación ganadera
  final List<String> _cargos = const [
    'Administrador de Finca',
    'Mayordomo / Encargado',
    'Méd. Veterinario / Zootecnista',
    'Op. Ganadero / Corralero',
    'Prop. / Socio Ganadero',
    'Auxiliar de Campo',
  ];
  String? _selectedCargo;

  @override
  void dispose() {
    _nombreController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (_formKey.currentState?.validate() ?? false) {
      if (!_aceptaTerminos) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Debes aceptar los términos de uso y políticas.'),
            backgroundColor: Color(0xFF5A1E1E),
          ),
        );
        return;
      }

      setState(() => _isLoading = true);
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() => _isLoading = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Cuenta creada para ${_nombreController.text} en Finca ${_selectedFinca?.nombre}',
              ),
              backgroundColor: const Color(0xFF1E350E),
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
          // 1. Fondo de matriz de puntos idéntico al Login
          Positioned.fill(
            child: CustomPaint(painter: const RegisterDotGridPainter()),
          ),

          // 2. Silueta de paisaje en la base
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 75,
            child: CustomPaint(painter: const RegisterHillsPainter()),
          ),

          // 3. Formulario Scrollable
          SafeArea(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 0,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),

                      // --- HEADER HORIZONTAL (Tal cual la referencia) ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // 3 cabezas doradas
                          Row(
                            children: List.generate(3, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 3.5),
                                child: CustomPaint(
                                  size: const Size(16, 16),
                                  painter: const RegisterCattleHeadPainter(
                                    color: AppColors.goldenAccent,
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(width: 14),

                          // Separador vertical fino
                          /* Container(
                            height: 32,
                            width: 1.0,
                            color: const Color(0xFF334520),
                          ), */
                          /* const SizedBox(width: 14),
            
                          // Logo TULE
                          const Text(
                            'TULE',
                            style: TextStyle(
                              fontFamily: 'serif',
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 4.5,
                              color: AppColors.primaryCream,
                              height: 1.0,
                            ),
                          ), */
                          //const SizedBox(width: 14),

                          // Lema en tres renglones
                          /* const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gestión',
                                style: TextStyle(
                                  fontFamily: 'sans-serif',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  height: 1.1,
                                ),
                              ),
                              Text(
                                'Ganadera',
                                style: TextStyle(
                                  fontFamily: 'sans-serif',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  height: 1.1,
                                ),
                              ),
                              Text(
                                'Inteligente',
                                style: TextStyle(
                                  fontFamily: 'sans-serif',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  height: 1.1,
                                ),
                              ),
                            ],
                          ), */
                        ],
                      ),
                      const SizedBox(height: 25),

                      // --- BADGE: EMPIEZA AQUÍ ---
                      const Text(
                        'EMPIEZA AQUÍ',
                        style: TextStyle(
                          fontFamily: 'sans-serif',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2.2,
                          color: AppColors.goldenAccent,
                        ),
                      ),
                      const SizedBox(height: 6),

                      // --- TÍTULO ---
                      const Text(
                        'Crea tu cuenta',
                        style: TextStyle(
                          fontFamily: 'serif',
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryCream,
                        ),
                      ),

                      /* const SizedBox(height: 8),
            
                      // --- SUBTÍTULO ---
                      const Text(
                        'Lleva el control de tu finca con información clara y decisiones más rápidas.',
                        style: TextStyle(
                          fontFamily: 'sans-serif',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.subtitleColor,
                          height: 1.35,
                        ),
                      ), */
                      const SizedBox(height: 20),

                      // --- CAMPO 1: NOMBRE COMPLETO ---
                      buildLabel('Nombre completo', AppColors.primaryCream),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _nombreController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.5,
                        ),
                        decoration: buildInputDecoration(
                          hint: 'Ej. Carlos Rodríguez',
                          prefixIcon: Icons.person_outline_rounded,
                          fillColor: AppColors.inputFillColor,
                          borderColor: AppColors.inputBorderColor,
                          goldenColor: AppColors.goldenAccent,
                        ),
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? 'Ingresa tu nombre'
                            : null,
                      ),

                      const SizedBox(height: 18),

                      // --- FACTOR 1: FINCA A LA QUE PERTENECE ---
                      buildLabel('Finca / Operación', AppColors.primaryCream),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<FincaOption>(
                        value: _selectedFinca,
                        isExpanded: true,
                        dropdownColor: const Color(0xFF15220B),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppColors.goldenAccent,
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.5,
                        ),
                        decoration: buildInputDecoration(
                          hint: 'Selecciona tu finca (Villapaulina o Tule)',
                          prefixIcon: Icons.home_work_outlined,
                          fillColor: AppColors.inputFillColor,
                          borderColor: AppColors.inputBorderColor,
                          goldenColor: AppColors.goldenAccent,
                        ),
                        /* items: _fincas.map((finca) {
                          return DropdownMenuItem<FincaOption>(
                            value: finca,
                            child: Row(
                              children: [
                                Icon(
                                  finca.icon,
                                  size: 18,
                                  color: AppColors.goldenAccent,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: RichText(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                      text: finca.nombre,
                                      style: const TextStyle(
                                        color: AppColors.primaryCream,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.5,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' (${finca.ubicacion})',
                                          style: const TextStyle(
                                            color: Color(0xFF8E9A7B),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(), */
                        items: _fincas.map((finca) {
                          return DropdownMenuItem<FincaOption>(
                            value: finca,
                            child: Text(
                              '${finca.nombre} (${finca.ubicacion})',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.5,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (val) =>
                            setState(() => _selectedFinca = val),
                        validator: (val) => val == null
                            ? 'Por favor selecciona la finca'
                            : null,
                      ),

                      const SizedBox(height: 18),

                      // --- FACTOR 2: CARGO / ROL EN LA OPERACIÓN ---
                      buildLabel(
                        'Cargo en la operación',
                        AppColors.primaryCream,
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: _selectedCargo,
                        dropdownColor: const Color(0xFF15220B),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppColors.goldenAccent,
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.5,
                        ),
                        decoration: buildInputDecoration(
                          hint: 'Selecciona tu cargo',
                          prefixIcon: Icons.badge_outlined,
                          fillColor: AppColors.inputFillColor,
                          borderColor: AppColors.inputBorderColor,
                          goldenColor: AppColors.goldenAccent,
                        ),
                        items: _cargos.map((cargo) {
                          return DropdownMenuItem<String>(
                            value: cargo,
                            child: Text(
                              cargo,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14.5,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (val) =>
                            setState(() => _selectedCargo = val),
                        validator: (val) => val == null
                            ? 'Por favor selecciona tu cargo'
                            : null,
                      ),

                      const SizedBox(height: 18),

                      // --- CAMPO: CORREO ELECTRÓNICO ---
                      buildLabel('Correo electrónico', AppColors.primaryCream),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.5,
                        ),
                        decoration: buildInputDecoration(
                          hint: 'tu@correo.com',
                          prefixIcon: Icons.mail_outline_rounded,
                          fillColor: AppColors.inputFillColor,
                          borderColor: AppColors.inputBorderColor,
                          goldenColor: AppColors.goldenAccent,
                        ),
                        validator: (v) => (v == null || !v.contains('@'))
                            ? 'Ingresa un correo válido'
                            : null,
                      ),

                      const SizedBox(height: 18),

                      // --- CAMPO: CONTRASEÑA ---
                      buildLabel('Contraseña', AppColors.primaryCream),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.5,
                        ),
                        decoration: buildInputDecoration(
                          hint: 'Mínimo 8 caracteres',
                          prefixIcon: Icons.lock_outline_rounded,
                          fillColor: AppColors.inputFillColor,
                          borderColor: AppColors.inputBorderColor,
                          goldenColor: AppColors.goldenAccent,
                          suffix: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: AppColors.goldenAccent,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(
                                () => _obscurePassword = !_obscurePassword,
                              );
                            },
                          ),
                        ),
                        validator: (v) => (v == null || v.length < 8)
                            ? 'Mínimo 8 caracteres'
                            : null,
                      ),

                      const SizedBox(height: 16),

                      // --- CHECKBOX TÉRMINOS Y CONDICIONES ---
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => setState(
                              () => _aceptaTerminos = !_aceptaTerminos,
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(top: 2),
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: _aceptaTerminos
                                    ? AppColors.goldenAccent
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: _aceptaTerminos
                                      ? AppColors.goldenAccent
                                      : const Color(0xFF909A7A),
                                  width: 1.4,
                                ),
                              ),
                              child: _aceptaTerminos
                                  ? const Icon(
                                      Icons.check,
                                      size: 14,
                                      color: AppColors.darkButtonText,
                                    )
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(
                                () => _aceptaTerminos = !_aceptaTerminos,
                              ),
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'sans-serif',
                                    fontSize: 13.0,
                                    color: AppColors.subtitleColor,
                                    height: 1.35,
                                  ),
                                  children: [
                                    TextSpan(text: 'Acepto los '),
                                    TextSpan(
                                      text: 'términos de uso',
                                      style: TextStyle(
                                        color: AppColors.goldenAccent,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(text: ' y la '),
                                    TextSpan(
                                      text: 'política de privacidad',
                                      style: TextStyle(
                                        color: AppColors.goldenAccent,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(text: ' de TULE.'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // --- BOTÓN PRINCIPAL: CREAR MI CUENTA ---
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _handleRegister,
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
                                  'Crear mi cuenta',
                                  style: TextStyle(
                                    fontFamily: 'sans-serif',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.darkButtonText,
                                  ),
                                ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // --- TARJETA DE SEGURIDAD / PROTECCIÓN DE DATOS ---
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.inputFillColor.withValues(
                            alpha: 0.4,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFF283918),
                            width: 1.1,
                          ),
                        ),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.verified_user_outlined,
                              color: AppColors.goldenAccent,
                              size: 20,
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Tus datos estarán protegidos y solo se usarán para gestionar tu operación.',
                                style: TextStyle(
                                  fontFamily: 'sans-serif',
                                  fontSize: 12.5,
                                  color: AppColors.subtitleColor,
                                  height: 1.35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      // --- ENLACE A INICIAR SESIÓN ---
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(
                              context,
                            ); // Regresa a la pantalla de Login
                          },
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontFamily: 'sans-serif',
                                fontSize: 13.5,
                                color: AppColors.subtitleColor,
                              ),
                              children: [
                                TextSpan(text: '¿Ya tienes una cuenta? '),
                                TextSpan(
                                  text: 'Inicia sesión',
                                  style: TextStyle(
                                    color: AppColors.goldenAccent,
                                    fontWeight: FontWeight.w700,
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

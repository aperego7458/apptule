import 'package:apptule/menu/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:apptule/config/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DrawerOption _selected = DrawerOption.inicio;

  // Datos temporales (luego vendrán del login / backend)
  final String _userName = 'Juan Pérez';
  final String _farmName = 'Finca "El Paraíso"';

  void _handleSelection(DrawerOption option) {
    // Cierra el drawer
    Navigator.of(context).pop();

    if (option == DrawerOption.cerrarSesion) {
      _handleLogout();
      return;
    }

    setState(() => _selected = option);

    // TODO: navegar a cada sección cuando esté la lógica
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Seleccionaste: ${option.name}'),
        backgroundColor: AppColors.inputFillColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _handleLogout() {
    // TODO: lógica real de cierre de sesión
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.backgColor,
      drawer: AppDrawer(
        userName: _userName,
        farmName: _farmName,
        selected: _selected,
        onSelected: _handleSelection,
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // Barra superior con botón de menú
  // ─────────────────────────────────────────────
  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: const Icon(Icons.menu_rounded),
            color: AppColors.primaryCream,
            tooltip: 'Abrir menú',
          ),
          const SizedBox(width: 4),
          const Text(
            'TULE',
            style: TextStyle(
              color: AppColors.primaryCream,
              fontSize: 22,
              fontWeight: FontWeight.w800,
              letterSpacing: 3,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              // TODO: notificaciones
            },
            icon: const Icon(Icons.notifications_none_rounded),
            color: AppColors.primaryCream,
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // Contenido del Home (placeholder mientras hay lógica)
  // ─────────────────────────────────────────────
  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Saludo
          Text(
            'Hola, $_userName 👨‍🌾',
            style: const TextStyle(
              color: AppColors.primaryCream,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(
                Icons.location_on_rounded,
                size: 14,
                color: AppColors.lightGreen,
              ),
              const SizedBox(width: 4),
              Text(
                _farmName,
                style: const TextStyle(
                  color: AppColors.subtitleColor,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Accesos rápidos (grid 2x3)
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.5,
            children: const [
              _QuickCard(
                icon: Icons.pets_rounded,
                label: 'Mi Ganado',
                option: DrawerOption.miGanado,
              ),
              _QuickCard(
                icon: Icons.grass_rounded,
                label: 'Pastos',
                option: DrawerOption.pastos,
              ),
              _QuickCard(
                icon: Icons.vaccines_rounded,
                label: 'Vacunación',
                option: DrawerOption.vacunacion,
              ),
              _QuickCard(
                icon: Icons.child_friendly_rounded,
                label: 'Partos',
                option: DrawerOption.partos,
              ),
              _QuickCard(
                icon: Icons.attach_money_rounded,
                label: 'Ventas',
                option: DrawerOption.ventas,
              ),
              _QuickCard(
                icon: Icons.bar_chart_rounded,
                label: 'Reportes',
                option: DrawerOption.reportes,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Resumen rápido (placeholder)
          const Text(
            'Resumen rápido',
            style: TextStyle(
              color: AppColors.primaryCream,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.inputFillColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.inputBorderColor),
            ),
            child: const Text(
              'Aquí irá el resumen de tu finca (vacas, terneros, vacunas...) cuando esté lista la lógica. 🐄',
              style: TextStyle(
                color: AppColors.subtitleColor,
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Tarjeta reutilizable de acceso rápido
// ─────────────────────────────────────────────
class _QuickCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final DrawerOption option;

  const _QuickCard({
    required this.icon,
    required this.label,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputFillColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.inputBorderColor),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          splashColor: AppColors.goldenAccent.withValues(alpha: 0.15),
          onTap: () {
            // TODO: navegar a la sección
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Ir a $label'),
                backgroundColor: AppColors.inputFillColor,
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: AppColors.goldenAccent, size: 28),
                const SizedBox(height: 10),
                Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.primaryCream,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

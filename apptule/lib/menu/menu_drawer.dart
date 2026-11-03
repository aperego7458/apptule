import 'package:apptule/config/app_colors.dart';
import 'package:flutter/material.dart';

/// Opciones del menú lateral.
enum DrawerOption {
  inicio,
  miGanado,
  pastos,
  vacunacion,
  partos,
  ventas,
  reportes,
  configuracion,
  ayuda,
  cerrarSesion,
}

class _DrawerItemData {
  final DrawerOption option;
  final IconData icon;
  final String label;

  const _DrawerItemData(this.option, this.icon, this.label);
}

class AppDrawer extends StatelessWidget {
  final String userName;
  final String farmName;
  final DrawerOption selected;
  final ValueChanged<DrawerOption> onSelected;

  const AppDrawer({
    super.key,
    required this.userName,
    required this.farmName,
    required this.onSelected,
    this.selected = DrawerOption.inicio,
  });

  static const _mainItems = <_DrawerItemData>[
    _DrawerItemData(DrawerOption.inicio, Icons.home_rounded, 'Inicio'),
    _DrawerItemData(DrawerOption.miGanado, Icons.pets_rounded, 'Mi Ganado'),
    _DrawerItemData(DrawerOption.pastos, Icons.grass_rounded, 'Pastos'),
    _DrawerItemData(
      DrawerOption.vacunacion,
      Icons.vaccines_rounded,
      'Vacunación',
    ),
    _DrawerItemData(
      DrawerOption.partos,
      Icons.child_friendly_rounded,
      'Partos',
    ),
    _DrawerItemData(DrawerOption.ventas, Icons.attach_money_rounded, 'Ventas'),
    _DrawerItemData(DrawerOption.reportes, Icons.bar_chart_rounded, 'Reportes'),
  ];

  static const _secondaryItems = <_DrawerItemData>[
    _DrawerItemData(
      DrawerOption.configuracion,
      Icons.settings_rounded,
      'Configuración',
    ),
    _DrawerItemData(DrawerOption.ayuda, Icons.info_outline_rounded, 'Ayuda'),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            _Header(onClose: () => Navigator.of(context).maybePop()),
            _UserCard(userName: userName, farmName: farmName),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  for (final item in _mainItems) _tile(item),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Divider(
                      color: AppColors.inputBorderColor,
                      height: 1,
                    ),
                  ),
                  for (final item in _secondaryItems) _tile(item),
                ],
              ),
            ),
            const Divider(color: AppColors.inputBorderColor, height: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: _MenuTile(
                icon: Icons.logout_rounded,
                label: 'Cerrar sesión',
                isSelected: false,
                iconColor: AppColors.goldenAccent,
                onTap: () => onSelected(DrawerOption.cerrarSesion),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile(_DrawerItemData item) {
    return _MenuTile(
      icon: item.icon,
      label: item.label,
      isSelected: selected == item.option,
      onTap: () => onSelected(item.option),
    );
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onClose;

  const _Header({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
      child: Row(
        children: [
          IconButton(
            onPressed: onClose,
            icon: const Icon(Icons.menu_rounded),
            color: AppColors.primaryCream,
            tooltip: 'Cerrar menú',
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
        ],
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  final String userName;
  final String farmName;

  const _UserCard({required this.userName, required this.farmName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.inputFillColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.inputBorderColor),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.backgColor,
              border: Border.all(color: AppColors.goldenAccent, width: 1.5),
            ),
            child: const Icon(
              Icons.person_rounded,
              color: AppColors.primaryCream,
              size: 28,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.primaryCream,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_rounded,
                      size: 14,
                      color: AppColors.lightGreen,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        farmName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.subtitleColor,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? iconColor;

  const _MenuTile({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color fg = isSelected
        ? AppColors.primaryCream
        : AppColors.subtitleColor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Material(
        color: isSelected ? AppColors.inputFillColor : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: AppColors.goldenAccent.withValues(alpha: 0.15),
          highlightColor: AppColors.inputBorderColor.withValues(alpha: 0.4),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? AppColors.goldenAccent.withValues(alpha: 0.6)
                    : Colors.transparent,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 22,
                  color:
                      iconColor ??
                      (isSelected
                          ? AppColors.goldenAccent
                          : AppColors.lightGreen),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: fg,
                      fontSize: 15.5,
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                    ),
                  ),
                ),
                if (isSelected)
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppColors.goldenAccent,
                      shape: BoxShape.circle,
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

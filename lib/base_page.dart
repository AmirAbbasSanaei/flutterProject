import 'package:flutter/material.dart';
import 'package:flutter_application_2/sidebar_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HoverDrawer extends StatelessWidget {
  final Widget body;
  final String title;

  const HoverDrawer({required this.body, this.title = "عنوان صفحه", super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SidebarBloc>().state;
    final isDrawerOpen = state.isPinned || state.isHovered;

    return Row(
      children: [
        MouseRegion(
          onEnter: (_) {
            if (!state.isPinned) {
              context.read<SidebarBloc>().add(SetHoverState(true));
            }
          },
          onExit: (_) {
            if (!state.isPinned) {
              context.read<SidebarBloc>().add(SetHoverState(false));
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: isDrawerOpen ? 200 : 60,
            color: Colors.blue.shade700,
            child: Column(
              children: [
                const SizedBox(height: 40),
                IconButton(
                  icon: Icon(
                    state.isPinned ? Icons.push_pin : Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    context.read<SidebarBloc>().add(ToggleSidebarPin());
                  },
                ),
                _buildNavItem(
                  icon: Icons.home,
                  label: "صفحه اصلی",
                  context: context,
                  route: "/main-page",
                  isDrawerOpen: isDrawerOpen,
                ),
                _buildNavItem(
                  icon: Icons.calculate,
                  label: "ماشین حساب",
                  context: context,
                  route: "/calculator",
                  isDrawerOpen: isDrawerOpen,
                ),
                _buildNavItem(
                  icon: Icons.settings,
                  label: "تنظیمات",
                  context: context,
                  route: "/setting",
                  isDrawerOpen: isDrawerOpen,
                ),
                const Spacer(),
                _buildNavItem(
                  icon: Icons.logout,
                  label: "خروج",
                  context: context,
                  route: "/",
                  isDrawerOpen: isDrawerOpen,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        Expanded(child: body),
      ],
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String route,
    required bool isDrawerOpen,
  }) {
    final currentRoute = GoRouter.of(context).location;
    final isActive = currentRoute == route;

    return InkWell(
      onTap: () {
        if (!isActive) {
          context.go(route);
        }
      },
      child: Container(
        color: isActive ? Colors.blue.shade900 : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            if (isDrawerOpen) ...[
              const SizedBox(width: 12),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class BasePage extends StatelessWidget {
  final Widget body;
  final String title;
  const BasePage({required this.body, this.title = "عنوان صفحه", super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 128, 151, 255),
        elevation: 0.0,
        title: Text(title),
      ),
      body: HoverDrawer(body: body, title: title),
    );
  }
}

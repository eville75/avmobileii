import 'package:flutter/material.dart';
import 'settings_view_model.dart';
import '../../design_system/theme/app_theme.dart';
import '../../design_system/theme/app_typography.dart';
import '../../design_system/theme/app_colors.dart';

class SettingsView extends StatelessWidget {
  final SettingsViewModel viewModel;

  const SettingsView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final user = viewModel.user;

    return Container(
      decoration: AppTheme.backgroundGradient,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Configurações", style: AppTypography.h2),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(
                    user.avatarUrl.isEmpty
                        ? "https://via.placeholder.com/150"
                        : user.avatarUrl,
                  ),
                ),
                const SizedBox(height: 12),
                Text(user.name, style: AppTypography.h2),
                const SizedBox(height: 4),
                Text(user.email, style: AppTypography.body),
              ],
            ),
            const SizedBox(height: 32),

            _settingsTile(
              icon: Icons.person,
              label: "Editar nome",
              onTap: () => _showEditDialog(
                context,
                title: "Editar nome",
                initialValue: user.name,
                onSave: (v) => viewModel.updateName(v),
              ),
            ),

            _settingsTile(
              icon: Icons.email,
              label: "Editar e-mail",
              onTap: () => _showEditDialog(
                context,
                title: "Editar e-mail",
                initialValue: user.email,
                onSave: (v) => viewModel.updateEmail(v),
              ),
            ),

            _settingsTile(
              icon: Icons.lock,
              label: "Alterar senha",
              onTap: () => _showEditDialog(
                context,
                title: "Nova senha",
                initialValue: "",
                isPassword: true,
                onSave: (v) {},
              ),
            ),

            const SizedBox(height: 16),

            _settingsTile(
              icon: Icons.info_outline,
              label: "Sobre o app",
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: "Mood Music",
                  applicationVersion: "1.0.0",
                  applicationLegalese: "Desenvolvido por Sapatinha 💙",
                );
              },
            ),

            const SizedBox(height: 16),

            _settingsTile(
              icon: Icons.logout,
              label: "Sair",
              color: Colors.redAccent,
              onTap: () => viewModel.logout(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingsTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color color = Colors.white,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.glassEffect,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(label, style: AppTypography.body.copyWith(color: color)),
        trailing: Icon(Icons.chevron_right, color: color),
        onTap: onTap,
      ),
    );
  }

  void _showEditDialog(
    BuildContext context, {
    required String title,
    required String initialValue,
    required Function(String) onSave,
    bool isPassword = false,
  }) {
    final controller = TextEditingController(text: initialValue);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.card,
        title: Text(title, style: AppTypography.h2),
        content: TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            child: const Text("Cancelar"),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text("Salvar"),
            onPressed: () {
              onSave(controller.text);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

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
            // ----------- CABEÇALHO COM NOME E EMAIL -----------
            Column(
              children: [
                const SizedBox(height: 12),
                Text(user.name, style: AppTypography.h2),
                const SizedBox(height: 4),
                Text(user.email, style: AppTypography.body),
              ],
            ),

            const SizedBox(height: 32),

            // -----------------------------------------
            // 🔹 COMO FUNCIONA O APP (NOVO)
            // -----------------------------------------
            _settingsTile(
              icon: Icons.help_outline,
              label: "Como funciona o app",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    backgroundColor: AppColors.card,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    title: Text("Como funciona o Mood Music", style: AppTypography.h2),
                    content: SingleChildScrollView(
                      child: Text(
                        """
O Mood Music ajuda você a encontrar playlists baseadas no seu humor.

🎧 COMO FUNCIONA:
• Você escolhe seu sentimento atual.
• O app identifica a categoria emocional (positiva, negativa ou neutra).
• Uma playlist sugerida é exibida automaticamente.

💙 OBJETIVO:
Oferecer uma experiência simples, personalizada e rápida para conectar seu estado emocional com músicas que combinam com você.

✨ Dica:
Use diariamente para registrar seu humor e descobrir novos estilos musicais recomendados!
                        """,
                        style: AppTypography.body,
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: const Text("Entendi"),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            // ----------- SOBRE O APP -----------
            _settingsTile(
              icon: Icons.info_outline,
              label: "Sobre o app",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    backgroundColor: AppColors.card,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    title: Text("Mood Music", style: AppTypography.h2),
                    content: Text(
                      "App desenvolvido pela Eville 💙",
                      style: AppTypography.body,
                    ),
                    actions: [
                      TextButton(
                        child: const Text("Fechar"),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            // ----------- SAIR -----------
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

  // --------------------------------------------------------
  //  TILE PADRÃO
  // --------------------------------------------------------
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
}

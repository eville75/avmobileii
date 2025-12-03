import 'package:flutter/material.dart';
import '../../design_system/theme/app_typography.dart';
import '../../design_system/theme/app_spacing.dart';
import '../../design_system/theme/app_theme.dart';
import '../../design_system/widgets/mood_button.dart';
import 'mood_view_model.dart';
import '../home/home_factory.dart';
import '../settings/settings_factory.dart';

class MoodView extends StatelessWidget {
  final MoodViewModel viewModel;

  const MoodView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.backgroundGradient,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header com Configurações
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Como você se sente agora?", style: AppTypography.h1),
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // ❌ ANTIGO: SettingsFactory.create(viewModel.user)
                            // ✔ NOVO:
                            builder: (_) => SettingsFactory.create(),
                          ),
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.sm),
                Text(
                  "Toque em um sentimento para encontrar a playlist",
                  style: AppTypography.body,
                ),

                const SizedBox(height: AppSpacing.xl),

                // POSITIVOS
                Text("Sentimentos Positivos", style: AppTypography.h2),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    MoodButton(label: "Feliz", type: MoodType.positive, onTap: () => _go(context, "Feliz")),
                    MoodButton(label: "Motivado", type: MoodType.positive, onTap: () => _go(context, "Motivado")),
                    MoodButton(label: "Alegre", type: MoodType.positive, onTap: () => _go(context, "Alegre")),
                  ],
                ),

                const SizedBox(height: AppSpacing.lg),

                // NEGATIVOS
                Text("Sentimentos Negativos", style: AppTypography.h2),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    MoodButton(label: "Triste", type: MoodType.negative, onTap: () => _go(context, "Triste")),
                    MoodButton(label: "Ansioso", type: MoodType.negative, onTap: () => _go(context, "Ansioso")),
                    MoodButton(label: "Cansado", type: MoodType.negative, onTap: () => _go(context, "Cansado")),
                  ],
                ),

                const SizedBox(height: AppSpacing.lg),

                // NEUTROS
                Text("Sentimentos Neutros", style: AppTypography.h2),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    MoodButton(label: "Calmo", type: MoodType.neutral, onTap: () => _go(context, "Calmo")),
                    MoodButton(label: "Sereno", type: MoodType.neutral, onTap: () => _go(context, "Sereno")),
                    MoodButton(label: "Neutro", type: MoodType.neutral, onTap: () => _go(context, "Neutro")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _go(BuildContext context, String mood) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => HomeFactory.create(mood)),
    );
  }
}

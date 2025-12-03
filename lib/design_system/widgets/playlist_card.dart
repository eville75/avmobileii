import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class PlaylistCard extends StatelessWidget {
  final String title;
  final String thumbnailUrl;
  final VoidCallback onTap;

  const PlaylistCard({
    super.key,
    required this.title,
    required this.thumbnailUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.glassBorder.withOpacity(0.5),
              width: 1.4,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Imagem vertical no padrão do protótipo
              AspectRatio(
                aspectRatio: 3 / 4,
                child: Image.network(
                  thumbnailUrl,
                  fit: BoxFit.cover,
                ),
              ),

              // Gradiente + título
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.85),
                    ],
                  ),
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

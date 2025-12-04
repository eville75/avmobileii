import 'package:flutter/material.dart';
import 'core/app_coordinator.dart';
import 'core/app_routes.dart';
import 'design_system/theme/app_theme.dart';

void main() {
  runApp(const MoodApp());
}

class MoodApp extends StatelessWidget {
  const MoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mood Music",
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppCoordinator.generateRoute,
      initialRoute: AppRoutes.login,
    );
  }
}

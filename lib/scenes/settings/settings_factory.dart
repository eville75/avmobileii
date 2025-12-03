import 'package:flutter/material.dart';
import 'settings_view.dart';
import 'settings_view_model.dart';
import 'settings_service.dart';

class SettingsFactory {
  static Widget create() {
    final service = SettingsService();
    final viewModel = SettingsViewModel(service: service);
    return SettingsView(viewModel: viewModel);
  }
}

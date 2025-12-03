import 'package:flutter/material.dart';
import 'package:mibilleii/shared/models/user_model.dart';
import 'package:mibilleii/scenes/settings/settings_service.dart';

class SettingsViewModel extends ChangeNotifier {
  final SettingsService _service;

  UserModel user;

  SettingsViewModel({required SettingsService service})
      : _service = service,
        user = service.getUser();

  void updateName(String newName) {
    user = user.copyWith(name: newName);
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    user = user.copyWith(email: newEmail);
    notifyListeners();
  }

  Future<void> save() async {
    await _service.saveUser(user);
  }

  Future<void> logout(BuildContext context) async {
    await _service.logout(context);
  }
}

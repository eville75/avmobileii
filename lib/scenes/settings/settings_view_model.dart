import 'package:flutter/material.dart';
import '../../shared/models/user_model.dart';
import 'settings_service.dart';

class SettingsViewModel extends ChangeNotifier {
  final SettingsService _service;
  UserModel user;

  SettingsViewModel({
    required SettingsService service,
    required this.user,
  }) : _service = service;

  void updateName(String newName) {
    user = user.copyWith(name: newName);
    _service.saveUser(user);
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    user = user.copyWith(email: newEmail);
    _service.saveUser(user);
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    await _service.logout(context);
  }
}

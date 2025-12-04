import 'package:flutter/material.dart';
import '../../shared/models/user_model.dart';

class SettingsService {
  // O serviço mantém o usuário atual
  UserModel _user = const UserModel(
    id: "001",
    name: "Usuário",
    email: "email@email.com",
    avatarUrl: "",
  );

  UserModel getUser() => _user;

  Future<void> saveUser(UserModel user) async {
    _user = user;
    await Future.delayed(const Duration(milliseconds: 200));
  }

  Future<void> logout(BuildContext context) async {
    Navigator.pushReplacementNamed(context, "/login");
  }
}

import 'package:flutter/material.dart';
import 'login_view_model.dart';
import 'login_view.dart';
import 'login_service.dart';

class LoginFactory {
  static Widget create() {
    final service = LoginService();
    final viewModel = LoginViewModel(service: service);

    return LoginView(viewModel: viewModel);
  }
}

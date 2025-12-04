import 'package:flutter/material.dart';
import '../../design_system/theme/app_typography.dart';
import '../../design_system/theme/app_colors.dart';
import '../../design_system/theme/app_spacing.dart';
import '../../design_system/theme/app_theme.dart';
import 'login_view_model.dart';
import '../mood/mood_factory.dart';

class LoginView extends StatefulWidget {
  final LoginViewModel viewModel;

  const LoginView({super.key, required this.viewModel});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  bool isRegisterMode = false;
  bool showForgotPassword = false;
  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.backgroundGradient,
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // -------- TÍTULO --------
                  Text(
                    isRegisterMode ? "Criar Conta" : "Entrar",
                    style: AppTypography.h1,
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  // -------- NOME (somente no cadastro) --------
                  if (isRegisterMode)
                    Column(
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: "Nome",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),

                  // -------- EMAIL --------
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: "E-mail",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (_) {
                      setState(() {
                        showForgotPassword = emailController.text.isNotEmpty;
                      });
                    },
                  ),

                  const SizedBox(height: 12),

                  // -------- SENHA --------
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Senha",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // -------- ESQUECI MINHA SENHA --------
                  if (!isRegisterMode && showForgotPassword)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          codeSent = true;
                        });
                      },
                      child: const Text(
                        "Esqueci minha senha",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),

                  if (codeSent)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Um código foi enviado para ${emailController.text}",
                        style: AppTypography.body,
                        textAlign: TextAlign.center,
                      ),
                    ),

                  const SizedBox(height: 20),

                  // -------- BOTÃO ENTRAR / CADASTRAR --------
                  GestureDetector(
                    onTap: _onSubmit,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        isRegisterMode ? "Cadastrar" : "Entrar",
                        textAlign: TextAlign.center,
                        style: AppTypography.body.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // -------- ALTERNAR ENTRE "CRIAR CONTA" E "ENTRAR" --------
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRegisterMode = !isRegisterMode;
                        codeSent = false;
                      });
                    },
                    child: Text(
                      isRegisterMode ? "Já tenho conta" : "Criar uma conta",
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // -------- LÓGICA DE LOGIN E CADASTRO --------
  Future<void> _onSubmit() async {
    final vm = widget.viewModel;
    final email = emailController.text.trim();
    final pass = passwordController.text.trim();

    if (isRegisterMode) {
      final user = await vm.register(nameController.text, email, pass);
      if (user != null && mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => MoodFactory.create(user)),
        );
      }
    } else {
      final user = await vm.login(email, pass);
      if (user != null && mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => MoodFactory.create(user)),
        );
      }
    }
  }
}

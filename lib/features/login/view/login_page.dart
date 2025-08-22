import 'package:flutter/material.dart';
import 'package:ktoapp/shared/widgets/divider.dart';
import 'package:provider/provider.dart';

import '../../../app/app_state.dart';
import '../../../app/icons/icon.dart';
import '../../../app/langs/strings.g.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Registrar",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: MyIcon.icon("logo.svg", width: 100),
              ),
              const SizedBox(height: 16),
              const Text(
                "BEM-VINDO A KTO!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontFamily: "NNSwintonSTD",
                ),
              ),
              const SizedBox(height: 32),
              _socialButton(
                icon: "ic_google.png",
                label: "Entrar com o Google",
                onPressed: () {
                  final appState = context.read<AppState>();
                  appState.login();
                },
              ),
              const SizedBox(height: 12),
              _socialButton(icon: "ic_apple.png", label: "Entrar com a Apple"),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(child: AutoDivider.horizontal(height: 2)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      t.app.or,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(child: AutoDivider.horizontal(height: 2)),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                "E-mail",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Senha",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextField(
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  suffixIcon: IconButton(
                    icon: obscurePassword
                        ? MyIcon.icon(
                            "ic_password_show.svg",
                            color: Colors.white,
                          )
                        : MyIcon.icon(
                            "ic_password_hide.svg",
                            color: Colors.white,
                          ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Esqueceu sua senha?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: null,
                // () {
                //   final appState = context.read<AppState>();
                //   appState.login();
                // }, // 灰色不可点击
                style: ElevatedButton.styleFrom(
                  // disabledBackgroundColor: Color(0xffe1e1e1), //,//shade300,
                  // disabledForegroundColor: Color(0xffbdbdbd),
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Entrar",
                  // style: TextStyle(color: Color(0xffbdbdbd)),
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children: const [
                  Text("Jogar pode ser viciante."),
                  SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Por favor,jogue com responsabilidade.",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialButton({
    required String icon,
    required String label,
    Color? iconColor,
    Function? onPressed,
  }) {
    return OutlinedButton.icon(
      onPressed: () => onPressed?.call(),
      icon: Image.asset(
        "assets/images/$icon",
        width: 30,
        height: 30,
        color: iconColor,
      ),
      label: Text(label, style: const TextStyle(fontSize: 16)),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        textStyle: const TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

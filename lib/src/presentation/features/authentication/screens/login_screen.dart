import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:club_valledupar_app/lib.dart';

class LoginScreen extends GetView<LoginCtrl> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LoginHeader(title: "Iniciar sesión"),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Obx(() => LoginTextField(
                        label: "Correo electronico",
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: controller.setEmail,
                        errors: controller.errors('email'),
                      )),
                  Obx(
                    () => LoginTextField(
                      label: "Contraseña",
                      icon: Icons.lock,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      onChanged: controller.setPassword,
                      errors: controller.errors('password'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Obx(
                        () => Checkbox(
                          value: controller.rememberMe,
                          onChanged: controller.setRememberMe,
                        ),
                      ),
                      Text(
                        'Recordar',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text('¿Olvidaste tu contraseña?'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: AppRoundedButton(
                      label: 'Entrar',
                      onTap: controller.submit,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Center(
          child: TextButton(
            onPressed: () {},
            child: const Text('¿No tienes una cuenta? Registrate'),
          ),
        ),
      ),
    );
  }
}
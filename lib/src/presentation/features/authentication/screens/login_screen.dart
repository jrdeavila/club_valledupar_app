import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginCtrl> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          image: const DecorationImage(
            image: AssetImage('assets/img/background-welcome.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: BlurredContainer(
            height: 450.0,
            width: 350.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Iniciar sesión",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Get.find<ColorPalete>().textOnPrimary,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginTextField(
                      label: "Correo electronico",
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: controller.setEmail,
                      errors: controller.errors('email'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LoginTextField(
                      label: "Contraseña",
                      icon: Icons.lock,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      onChanged: controller.setPassword,
                      errors: controller.errors('password'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "¿Olvidaste tu contraseña?",
                          style: TextStyle(
                            color: Get.find<ColorPalete>().textOnPrimary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: AppRoundedButton(
                        label: 'ENTRAR',
                        onTap: controller.submit,
                        height: 60,
                        backgroundColor: Get.find<ColorPalete>().componentColor,
                        foregroundColor:
                            Get.find<ColorPalete>().textOnSecondary,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

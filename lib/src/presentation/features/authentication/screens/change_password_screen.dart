import 'package:club_valledupar_app/src/presentation/common/shared.dart';
import 'package:club_valledupar_app/src/presentation/features/features.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(
          color: Get.find<ColorPalete>().textOnPrimary,
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 140,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  "Cambiar contraseña",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Get.find<ColorPalete>().textOnPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/background-welcome.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const BlurredContainer(
            radius: 0,
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LoginTextField(
                    label: "Contraseña actual",
                    isPassword: true,
                    onChanged: controller.onOldPasswordChanged,
                  ),
                  const SizedBox(height: 10.0),
                  LoginTextField(
                    label: "Nueva contraseña",
                    isPassword: true,
                    onChanged: controller.onNewPasswordChanged,
                  ),
                  const SizedBox(height: 10.0),
                  LoginTextField(
                    label: "Confirmar contraseña",
                    isPassword: true,
                    onChanged: controller.onConfirmPasswordChanged,
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.8,
            child: Obx(
              () => controller.errors.isNotEmpty
                  ? Center(
                      child: Container(
                        height: 200,
                        margin: const EdgeInsets.all(20.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Get.find<ColorPalete>().componentOnError,
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ups! Hay algunos errors 😥",
                                style: TextStyle(
                                  color: Get.find<ColorPalete>().textOnError,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              ...controller.errors.map(
                                (e) => Text(
                                  "${controller.errors.indexOf(e) + 1}. $e",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Get.find<ColorPalete>().textOnError,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.submit,
        backgroundColor: Get.find<ColorPalete>().componentColor,
        foregroundColor: Get.find<ColorPalete>().textOnSecondary,
        child: const Icon(Icons.check),
      ),
    );
  }
}

import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileScreen extends GetView<UpdateProfileController> {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final addressCtrl = TextEditingController();

    Future.delayed(1.seconds, () {
      nameCtrl.text = controller.name;
      emailCtrl.text = controller.email;
      phoneCtrl.text = controller.phone;
      addressCtrl.text = controller.address;
    });
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/img/background-welcome.jpg",
            fit: BoxFit.cover,
          ),
          const BlurredContainer(
            radius: 0,
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar.large(
                title: Text(
                  "Actualizar perfil",
                  style: TextStyle(
                    color: Get.find<ColorPalete>().textOnPrimary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    Text(
                      "Manten actualizada tu información personal para que podamos brindarte un mejor servicio.",
                      style: TextStyle(
                        color: Get.find<ColorPalete>().textOnPrimary,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginTextField(
                      label: "Nombres",
                      controller: nameCtrl,
                      onChanged: controller.setName,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LoginTextField(
                      label: "Correo electrónico",
                      controller: emailCtrl,
                      onChanged: controller.setEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LoginTextField(
                      label: "Teléfono",
                      controller: phoneCtrl,
                      onChanged: controller.setPhone,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LoginTextField(
                      label: "Dirección",
                      onChanged: controller.setAddress,
                      controller: addressCtrl,
                    ),
                  ]),
                ),
              ),
              // Password
            ],
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: AppRoundedButton(
            label: "Actualizar",
            padding: EdgeInsets.zero,
            onTap: controller.updateProfile,
            radius: 10.0,
          ),
        ),
      ),
    );
  }
}

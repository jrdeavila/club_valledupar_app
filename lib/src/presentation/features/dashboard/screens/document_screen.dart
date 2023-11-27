import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:club_valledupar_app/lib.dart';

class DocumentScreen extends GetView<DocumentController> {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
              decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/document-background.jpg"),
              fit: BoxFit.cover,
            ),
          )),
          const BlurredContainer(
            radius: 0,
          ),
          Obx(() => CustomScrollView(
                slivers: [
                  SliverAppBar.large(
                    leading: const BackButton(color: Colors.white),
                    title: const Text("Mis Solicitudes"),
                    titleTextStyle: TextStyle(
                      color: Get.find<ColorPalete>().textOnPrimary,
                      fontSize: 30.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(20.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final document = controller.documents[index];
                          return DocumentRequestItem(
                            state: document.status,
                            type: document.documentRequestType,
                            date:
                                "Solicitado ${controller.formatDate(document.createdAt)}",
                          );
                        },
                        childCount: controller.documents.length,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _selectDocumentType(context);
        },
        label: const Text("Solicitar Documento"),
        icon: const Icon(Icons.description_outlined),
        backgroundColor: Get.find<ColorPalete>().componentColor,
        foregroundColor: Get.find<ColorPalete>().textOnSecondary,
      ),
    );
  }

  Future<dynamic> _selectDocumentType(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Get.find<ColorPalete>().componentColor,
      builder: (context) {
        return const ModalDocumentTypes();
      },
    );
  }
}

class ModalDocumentTypes extends GetView<DocumentController> {
  const ModalDocumentTypes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    controller.fetchDocumentTypes();
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Seleccione el documento que desea solicitar",
              style: TextStyle(
                color: Get.find<ColorPalete>().textOnSecondary,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: controller.isLoading
                  ? ListView.builder(itemBuilder: (context, index) {
                      return const DropDownCardModalItemSkeleton();
                    })
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        final option = controller.documentTypes[index];
                        return GestureDetector(
                          onTap: () {
                            controller.selectDocumentType(option);
                            Get.back();
                          },
                          child: DropDownCardModalItem(
                            title: option.name,
                            desc: option.description,
                          ),
                        );
                      },
                      itemCount: controller.documentTypes.length,
                    ),
            ),
          ],
        ),
      );
    });
  }
}

class DocumentRequestItem extends StatelessWidget {
  const DocumentRequestItem({
    super.key,
    required this.state,
    required this.type,
    required this.date,
  });

  final String state;
  final String type;
  final String date;

  @override
  Widget build(BuildContext context) {
    final textColor = Get.find<ColorPalete>().textOnSecondary;
    final bgColor = Get.find<ColorPalete>().componentColor;
    return Container(
      height: 150,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            type,
            style: TextStyle(
              color: textColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            statusLabel[state]!,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                date,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    configureDependencies();

    runApp(const MyApp());
  }, handlerException);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ColorPalete.themeData,
      getPages: [
        ...authPages,
      ],
      initialRoute: loginRoute,
      initialBinding: AppBindings(),
    );
  }
}

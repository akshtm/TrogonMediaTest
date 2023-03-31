import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:machinetest/ViewModel/Viewmodel.dart';
import 'package:machinetest/Screens/dashboard.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => Viewmodel())),
      ],
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Trogon Media Test',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Dashboard()),
    );
  }
}

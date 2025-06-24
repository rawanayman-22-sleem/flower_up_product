import 'package:bloc/bloc.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flower_up_product/core/services/custom_bloc_observer.dart';
import 'package:flower_up_product/core/services/get_service.dart';
import 'package:flower_up_product/features/add_product/add_product_view.dart';
import 'package:flower_up_product/welcom_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/services/storage_supabase.dart';
import 'core/widgets/constants.dart';
import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
 // await StorageSupabase.initSupabase();
 // await StorageSupabase.createBuckets('flowers_images');
 // Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);

  setupGetit();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  WelcomScreen(),
    );
  }
}



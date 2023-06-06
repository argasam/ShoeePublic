import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoee/route/go_router_provider.dart';
import 'package:shoee/view/auth_view.dart';
import 'package:go_router/go_router.dart';
import 'package:shoee/view/home_view.dart';
import 'package:shoee/view/login_view.dart';
import 'package:shoee/view/acc_view.dart';
import 'package:shoee/view/cart_view.dart';
import 'package:shoee/view/custom_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(
    const ProviderScope(child: Shoee())
  );
}

class Shoee extends ConsumerStatefulWidget {
  const Shoee({super.key});

  @override
  ConsumerState<Shoee> createState() => _ShoeeState();
}

class _ShoeeState extends ConsumerState<Shoee> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);
    
    
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
      
    
  }
}

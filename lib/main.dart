import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/core/api_service.dart';
import 'package:graduation/core/bloc_observer.dart';
import 'package:graduation/firebase_options.dart';
import 'package:graduation/models/cart_provider.dart';
import 'package:graduation/models/fav_provider.dart';
import 'package:graduation/screens/beginning/splash_screen.dart';
import 'package:graduation/screens/proooduct/favorite_screen.dart';
import 'package:graduation/screens/videos_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  ApiService.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FinalProject());
}

class FinalProject extends StatelessWidget {
  const FinalProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: {
          '/favorites': (context) => const FavoriteScreen(),
          '/video': (context) => const VideoScreen(),
        },
      ),
    );
  }
}

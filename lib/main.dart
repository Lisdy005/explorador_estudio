import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'router/app_router.dart';
import 'state/app_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const MiAplicacion(),
    ),
  );
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Explorador de Recursos',

      theme: ThemeData(
        useMaterial3: true,

        colorSchemeSeed: Colors.indigo,

        scaffoldBackgroundColor: const Color(0xFFC7CBD5),

        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),

        cardTheme: CardThemeData(
          elevation: 3,
        ),
      ),

      routerConfig: appRouter,
    );
  }
}
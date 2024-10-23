import 'package:xuprememax/utils/utils.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: HomeScreen.path,
  routes: [
    GoRoute(
      path: HomeScreen.path,
      name: HomeScreen.name,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
  ],
);

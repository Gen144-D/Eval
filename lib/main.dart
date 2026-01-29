import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'evaluation_report_page.dart';
import 'pages/login_page.dart';
import 'providers/auth_provider.dart';
import 'providers/evaluation_provider.dart';
import 'providers/grade_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => EvaluationProvider()),
        ChangeNotifierProvider(create: (_) => GradeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EvalTrack',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          return authProvider.isAuthenticated
              ? const HomePage()
              : const LoginPage();
        },
      ),
    );
  }
}

// ✅ MAIN HOME PAGE WITH PROPER NAVIGATION CONTEXT
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EvalTrack')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'EvalTrack Modules',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Evaluation Report'),
              onTap: () {
                Navigator.pop(context); // close drawer first

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EvaluationReportPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Welcome to EvalTrack', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}

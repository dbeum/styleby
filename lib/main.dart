
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:styleby/home.dart';



// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//     print('Firebase initialized');
//   } catch (e) {
//     print('Error initializing Firebase: $e');
//   }
    

//   runApp(MyApp());
// }

void main() {
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light, // Light theme
        useMaterial3: true,
        // Define your light theme here
        primarySwatch: Colors.blue,
         textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black), // Text color for light mode
       
          // Add other text styles as needed
        ),
        // Other theme settings...
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Dark theme
        useMaterial3: true,
        // Define your dark theme here
        primarySwatch: Colors.blue,
         scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black), // Text color for light mode
       
          // Add other text styles as needed
        ),
        // Other theme settings...
      ),
      themeMode: ThemeMode.system, // Use system theme (light or dark)
      home:Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_network_layer_dio/core/network/api_client.dart';
// import 'package:flutter_network_layer_dio/core/network/api_client.dart';
// import 'package:flutter_network_layer_dio/presentation/home_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   Future<String?> getToken() async {
//     await Future.delayed(Duration(milliseconds: 100));
//     return 'dummy_token_123';
//   }

//   final dio = createDioClient(getToken: getToken);
//   final apiClient = ApiClient(dio);

//   runApp(MyApp(apiClient: apiClient));
// }

// class MyApp extends StatelessWidget {
//   final ApiClient apiClient;
//   const MyApp({super.key, required this.apiClient});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Network Layer Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: HomeScreen(apiClient: apiClient),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'presentation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Layer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

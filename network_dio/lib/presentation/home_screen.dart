// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_network_layer_dio/core/network/api_client.dart';
// import 'package:flutter_network_layer_dio/core/network/api_constants.dart';
// import 'package:flutter_network_layer_dio/models/post_model.dart';

// class HomeScreen extends StatefulWidget {
//   final ApiClient apiClient;
//   const HomeScreen({super.key, required this.apiClient});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Future<List<Post>> _postsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _postsFuture = fetchPosts();
//   }

//   Future<List<Post>> fetchPosts() async {
//     try {
//       final Response respPublic = await widget.apiClient.get(ApiConstants.posts, authorization: false);
//       final Response respProtected = await widget.apiClient.get(ApiConstants.posts, authorization: true);
//       final List data = respPublic.data as List;
//       return data.map((e) => Post.fromJson(e as Map<String, dynamic>)).toList();
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Network Layer Demo')),
//       body: FutureBuilder<List<Post>>(
//         future: _postsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState != ConnectionState.done) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//           final posts = snapshot.data ?? [];
//           return ListView.builder(
//             itemCount: posts.length,
//             itemBuilder: (context, index) {
//               final p = posts[index];
//               return ListTile(
//                 title: Text(p.title),
//                 subtitle: Text(p.body),
//                 leading: CircleAvatar(child: Text(p.id.toString())),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_network_layer_dio/data/repositories/post_repositories.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PostRepository repository = PostRepository();
  String result = "Loading posts...";

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  void fetchPosts() async {
    final response = await repository.getPosts();
    setState(() {
      if (response.isSuccess) {
        // Display JSON data as string (can later parse into model)
        result = response.data.toString();
      } else {
        result = "Error: ${response.errorMessage}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Network Layer Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Text(result),
      ),
    );
  }
}

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

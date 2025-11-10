/// Simulates fetching a token from secure storage or local storage
class DummyTokenStorage {
  static Future<String?> getToken() async {
    // Simulate a delay like reading from secure storage
    await Future.delayed(Duration(milliseconds: 100));
    return "dummy_token_123"; // Replace with real token in production
  }
}

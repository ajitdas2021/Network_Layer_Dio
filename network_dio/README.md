# flutter_network_layer_dio

Demo project implementing a generic network layer with Dio and an interceptor that respects an authorization flag.

## How it works

- `ApiClient` provides generic GET/POST methods with `authorization` parameter.
- `ApiInterceptor` checks `options.extra['authorization']` to attach a Bearer token.
- Dummy token provider returns 'dummy_token_123'.
- Example API calls use jsonplaceholder.typicode.com/posts.

## Run

1. flutter pub get
2. flutter run

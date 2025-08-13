
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen())
        ,
        GoRoute(
          path: '/detail',
          builder: ( _, _) => const DetailScreen()
        ),
        GoRoute(
          path: '/product/:id',
          builder: (context, state) {
            final productid = state.pathParameters['id'] ?? '';
            return ProductScreen(productid: productid);
          }
        )
      ]
  );

  runApp(Myapp(router: router));
}

class Myapp extends StatelessWidget {
  final GoRouter router;
  const Myapp({required this.router, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'),),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // context.go('/detail'); // 화면 이동
              context.push('/detail'); // 화면 이동
            },
            child: const Text('Go to Detail 123')
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail'),),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.pop();// 이전 화면으로 돌아가기
            },
            child: const Text('Back')),
      ),
    );
  }
}

class ProductScreen extends StatelessWidget {
  final String productid;
  const ProductScreen({required this.productid, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product $productid'),),
      body: Center(child: Text('Product ID $productid'),),
    );
  }
}
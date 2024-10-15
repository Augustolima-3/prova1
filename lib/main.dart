import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/cadastro.dart';
import 'package:flutter_application_1/View/cardapio.dart';
import 'package:flutter_application_1/View/login.dart';
import 'package:flutter_application_1/View/resumo.dart';
import 'package:flutter_application_1/View/detalhes.dart';


// Lista global para armazenar os pedidos
List<Map<String, dynamic>> carrinho = [];

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true, // Necessário para DevicePreview
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      initialRoute: 'login',
      routes: {
        'login': (context) => const Login(),
        'cadastro': (context) => const Cadastro(),
        'cardapio': (context) => const Cardapio(),
        'resumo': (context) => Resumo(), // Define rota para a tela de Carrinho/Resumo
      },
      // Rota dinâmica para a página de Detalhes
      onGenerateRoute: (settings) {
        if (settings.name == 'detalhes') {
          final args = settings.arguments as Map<String, dynamic>;

          return MaterialPageRoute(
            builder: (context) {
              return Detalhes(
                title: args['title'],
                description: args['description'],
                price: args['price'],
                imageUrl: args['imageUrl'], // Exemplo de como passar URL de imagem
              );
            },
          );
        }
        return null;
      },
    );
  }
}

// Exemplo de um widget que pode acessar as rotas de "detalhes" e "resumo"
class ExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo de Navegação'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navegando para a rota "detalhes"
                Navigator.pushNamed(
                  context,
                  'detalhes',
                  arguments: {
                    'title': 'Nome do Item',
                    'description': 'Descrição detalhada do item.',
                    'price': 49.99,
                    'imageUrl': 'assets/food.png', // Caminho da imagem
                  },
                );
              },
              child: const Text('Ir para Detalhes'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegando para a rota "resumo"
                Navigator.pushNamed(context, 'resumo');
              },
              child: const Text('Ir para Resumo (Carrinho)'),
            ),
          ],
        ),
      ),
    );
  }
}

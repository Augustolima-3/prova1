import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/resumo.dart';

List<Map<String, dynamic>> carrinho = []; // Lista global para armazenar os pedidos

class Detalhes extends StatefulWidget {
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  const Detalhes({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  _DetalhesState createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  int quantidade = 1; // Quantidade inicial de itens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Exibir a imagem do item
              Image.network(
                widget.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              
              // Nome do item
              Text(
                widget.title,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              
              // Descrição completa do item
              Text(
                widget.description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              
              // Preço do item
              Text(
                'R\$ ${widget.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              const SizedBox(height: 30),
              
              // Seção de contador de quantidade
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Botão de diminuir quantidade
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (quantidade > 1) {
                          quantidade--;
                        }
                      });
                    },
                  ),
                  // Exibir a quantidade atual
                  Text(
                    '$quantidade',
                    style: const TextStyle(fontSize: 20),
                  ),
                  // Botão de aumentar quantidade
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        quantidade++;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              
              // Botão para adicionar ao pedido
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Adicionar o item ao carrinho com a quantidade selecionada
                    carrinho.add({
                      'title': widget.title,
                      'price': widget.price,
                      'imageUrl': widget.imageUrl,
                      'quantidade': quantidade, // Utiliza a quantidade selecionada
                    });

                    // Ação ao adicionar ao pedido
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Item adicionado ao pedido com sucesso!'),
                      ),
                    );
                  },
                  child: const Text('Adicionar ao Pedido'),
                ),
              ),
              const SizedBox(height: 20),
              
              // Botão resumo
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navegar para a tela de resumo
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Resumo(), // Navega para a tela de resumo
                      ),
                    );
                  },
                  child: const Text('Resumo'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

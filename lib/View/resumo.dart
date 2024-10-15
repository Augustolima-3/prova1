import 'package:flutter/material.dart';
import 'detalhes.dart';

// Transformar Resumo em StatefulWidget para que a tela seja reconstruída sempre que necessário
class Resumo extends StatefulWidget {
  @override
  _ResumoState createState() => _ResumoState();
}

class _ResumoState extends State<Resumo> {
  @override
  Widget build(BuildContext context) {
    // Calcular o total do pedido
    double total = carrinho.fold(0, (sum, item) => sum + item['price'] * item['quantidade']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo do Pedido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Lista de itens no carrinho
            Expanded(
              child: ListView.builder(
                itemCount: carrinho.length,
                itemBuilder: (context, index) {
                  final item = carrinho[index];
                  return ListTile(
                    leading: Image.network(item['imageUrl'], width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(item['title']),
                    subtitle: Row(
                      children: [
                        // Botão de diminuir quantidade
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (item['quantidade'] > 1) {
                                // Decrementar quantidade no carrinho
                                item['quantidade']--;
                              } else {
                                // Se a quantidade for 1, pode remover o item
                                carrinho.removeAt(index);
                              }
                            });
                          },
                        ),
                        // Exibir quantidade atual
                        Text('Qtd: ${item['quantidade']}'),
                        // Botão de aumentar quantidade
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              item['quantidade']++; // Incrementar quantidade no carrinho
                            });
                          },
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Exibir preço total do item
                        Text('R\$ ${(item['price'] * item['quantidade']).toStringAsFixed(2)}'),
                        // Botão de remover item
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              carrinho.removeAt(index); // Remover o item do carrinho
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Exibir o valor total do pedido
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'R\$ ${total.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Botão para Confirmar o Pedido
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pedido confirmado com sucesso!')),
                  );
                },
                child: const Text('Confirmar Pedido'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

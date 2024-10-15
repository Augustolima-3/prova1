import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/detalhes.dart';

class Cardapio extends StatelessWidget {
  const Cardapio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardápio'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Entradas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildCategoryItem(context, 'Capeletti in Brodo', 'Uma deliciosa sopa com frango desfiado', 12.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbLgxYNaJmFj9EhyEHzsS-quN_JM4C0X0hPw&s'),
              _buildCategoryItem(context, 'Bruschetta', 'Pão tostado com tomate e manjericão', 8.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVrzFtszOP5snb-PDMUSyR3RbL91hKWjiS6A&s'),
              
              const SizedBox(height: 20),
              const Text(
                'Pratos Principais',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildCategoryItem(context, 'Rigatoni ala Carbonara', 'Macarrão ao dente com queijo, panceta de porco e ovos ', 29.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXkZBfkVdikIkp9edmQXT9NrROF2vSMo4bxQ&s'),
              _buildCategoryItem(context, 'Lasanha', 'Lasanha bolonhesa gratinada', 22.99, 'https://achougastronomia.com.br/receitas/wp-content/uploads/2022/01/Receita-de-lasanha-de-carne.jpg'),

              const SizedBox(height: 20),
              const Text(
                'Bebidas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildCategoryItem(context, 'Soda italiana', 'Água gaseificada com suco de frutas frescas', 4.99, 'https://api.baraberto.com.br/wp-content/uploads/2023/06/front-view-natural-organic-fuit-juices-bottles-served-with-tubes-wooden-cutting-board-1-scaled.jpg'),
              _buildCategoryItem(context, 'Vinho', 'Brunello di Montalcino, eleito o melhor vinho da Itália', 6.99, 'https://taafrl.vtexassets.com/arquivos/ids/155711/BRUNELLO-DI-MONTALCINO.jpg?v=637204516111570000'),

              const SizedBox(height: 20),
              const Text(
                'Sobremesas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildCategoryItem(context, 'Gelato', 'Delicioso sorvete no estilo italiano de ser feito', 9.99, 'https://files.oaiusercontent.com/file-xR5AD2KbbkftTXqRLelV6k9T?se=2024-10-09T16%3A52%3A12Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3D19df9b50-57dd-442a-b40f-9fcd1b52e3b2.webp&sig=wkhMYCLGtIJk%2BAT8npHzH/H9vwPCAMX4ovtQ8fLTE%2BM%3D'),
              _buildCategoryItem(context, 'Tiramisu', 'Uma sobremesa clássica da culinária', 7.99, 'https://files.oaiusercontent.com/file-MGkD3HZiNNrwar8uDDxB5rS3?se=2024-10-09T16%3A53%3A05Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3Ded00dabf-55df-4e86-a937-2b407ba923bd.webp&sig=n5DezyPhu0fYZ/jARxhT1ZkgrdpTmxaZRzGr6vyOO6g%3D'),
            ],
          ),
        ),
      ),
    );
  }

  // Método para criar cada item do cardápio e passar detalhes para a página de Detalhes
    Widget _buildCategoryItem(BuildContext context, String title, String description, double price, String imageUrl) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(description),
      trailing: Text('R\$ ${price.toStringAsFixed(2)}'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detalhes(
              title: title,
              description: description,
              price: price,
              imageUrl: imageUrl, // Você pode substituir com o URL real da imagem do item
            ),
          ),
        );
      },
    );
  }

}

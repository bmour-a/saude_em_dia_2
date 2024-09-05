import 'package:flutter/material.dart';

class DicasView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Dicas de Saúde',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'Pesquisar Dicas',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
           _buildTipCard(
              'Mantenha-se Hidratado',
              'Beba pelo menos 2 litros de água por dia.',
              'exercicio'),  
          _buildTipCard(
              'Exercício Regular',
              'Faça exercícios todos os dias.',
              'exercicio'), 
          _buildTipCard(
              'Alimentação Saudável',
              'Inclua frutas e vegetais em sua dieta diária.',
              'exercicio'),  
          _buildTipCard(
              'Exercícios Físicos',
              'Faça exercícios como andar de bike, correr e fazer caminhada.',
              'exercicio'), 
        ],
      ),
    );
  }

  Widget _buildTipCard(String title, String description, String image) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset('assets/images/$image.jpg'),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}
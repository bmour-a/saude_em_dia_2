import 'package:flutter/material.dart';
import 'editar_perfil_view.dart'; 

class PerfilView extends StatefulWidget {
  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  String _nome = 'Ana Beatriz';
  String _idade = '18 anos';
  String _peso = '59 kg';
  String _altura = '1.64 m';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Perfil do Usuário',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildProfileItem('Nome', _nome),
            _buildProfileItem('Idade', _idade),
            _buildProfileItem('Peso', _peso),
            _buildProfileItem('Altura', _altura),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditarPerfilView(
                      nome: _nome,
                      idade: _idade,
                      peso: _peso,
                      altura: _altura,
                    ),
                  ),
                );
                if (result != null) {
                  setState(() {
                    _nome = result['nome'];
                    _idade = result['idade'];
                    _peso = result['peso'];
                    _altura = result['altura'];
                  });
                }
              },
              icon: const Icon(Icons.edit, color: Color.fromARGB(255, 0, 153, 255)),
              label: const Text('Editar Perfil'),
              style: ElevatedButton.styleFrom(
               backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String label, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(label),
        trailing: Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

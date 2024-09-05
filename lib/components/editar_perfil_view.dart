import 'package:flutter/material.dart';

class EditarPerfilView extends StatefulWidget {
  final String nome;
  final String idade;
  final String peso;
  final String altura;

  EditarPerfilView({
    required this.nome,
    required this.idade,
    required this.peso,
    required this.altura,
  });

  @override
  _EditarPerfilViewState createState() => _EditarPerfilViewState();
}

class _EditarPerfilViewState extends State<EditarPerfilView> {
  late TextEditingController _nomeController;
  late TextEditingController _idadeController;
  late TextEditingController _pesoController;
  late TextEditingController _alturaController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.nome);
    _idadeController = TextEditingController(text: widget.idade);
    _pesoController = TextEditingController(text: widget.peso);
    _alturaController = TextEditingController(text: widget.altura);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _idadeController.dispose();
    _pesoController.dispose();
    _alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
        backgroundColor: Color.fromARGB(255, 3, 142, 255), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 0, 174, 255)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _idadeController,
              decoration: InputDecoration(
                labelText: 'Idade',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.cake, color: Color.fromARGB(255, 0, 183, 255)),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _pesoController,
              decoration: InputDecoration(
                labelText: 'Peso',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.monitor_weight, color: Color.fromARGB(255, 0, 132, 255)),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _alturaController,
              decoration: InputDecoration(
                labelText: 'Altura',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.height, color: Color.fromARGB(255, 0, 140, 255)),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop({
                  'nome': _nomeController.text,
                  'idade': _idadeController.text,
                  'peso': _pesoController.text,
                  'altura': _alturaController.text,
                });
              },
              icon: Icon(Icons.save, color: const Color.fromARGB(255, 0, 140, 255)),
              label: const Text('Salvar'),
              style: ElevatedButton.styleFrom(
            
                minimumSize: Size(double.infinity, 50), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}

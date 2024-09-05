import 'package:flutter/material.dart';
import 'package:saude_em_dia_2/components/dicas.view.dart';
import 'monitoramento_view.dart';
import 'perfil_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    InicioView(),
    MonitoramentoView(),
    DicasView(),
    PerfilView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saúde em Dia'),
        backgroundColor: Color.fromARGB(255, 36, 186, 255), 
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, 
        selectedItemColor: Colors.blue, 
        unselectedItemColor: Color.fromARGB(255, 0, 217, 255), 
        backgroundColor: Color.fromARGB(255, 255, 255, 255), 
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart),
            label: 'Monitoramento',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: 'Dicas de Saúde',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Botão Adicionar Pressionado')),
          );
        },
        backgroundColor: Color.fromARGB(255, 36, 175, 255), 
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, 
    );
  }
}

class InicioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( 
      padding: const EdgeInsets.all(16.0),
      child: Column(
       
        children: [
          const Text(
            'Bem-vindo ao Saúde em Dia!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildInfoCard(Icons.directions_walk, 'Quantidades de passos', '5,000 passos'),
          _buildInfoCard(Icons.favorite, 'Pressão Arterial', '120/80 mmHg'),
          _buildInfoCard(Icons.calendar_today, 'Próxima Consulta', '03 de Setembro, 2024'),
          _buildInfoCard(Icons.local_drink, 'Consumo de Água ao dia', '2 litros'),
        ],
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Color.fromARGB(255, 0, 174, 255)),
        title: Text(title),
        trailing: Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

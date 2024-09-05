import 'package:flutter/material.dart';
import 'package:graphic_representation/graphic_representation.dart';

class MonitoramentoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
             const Text(
              'Monitoramento',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            _buildLineChart(context),
            const SizedBox(height: 20),
            _buildMonitoringCard(Icons.monitor_weight, 'Peso', '59 kg', '03/09/2024', context),
            _buildMonitoringCard(Icons.favorite, 'Pressão Arterial', '120/80 mmHg', '03/09/2024', context),
            _buildMonitoringCard(Icons.favorite, 'Frequência Cardíaca', '72 bpm', '03/09/2024', context),
          ],
        ),
      ),
    );
  }

  Widget _buildLineChart(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: EccEcdGraphic(
        size: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.3),
        numsX: [0, 30, 15, 40, 50, 70, 130],
        numsY: [0, 23, 117, 27, 18, 39, 350],
        pourcentageMode: true,
        nbGradX: 14,
        nbGradY: 21,
        showECC: true,
        showECD: true,
        colorECC: Colors.purple,
        colorECD: Colors.brown,
        strokeLine: 2.0,
        showMedian: true,
        colorMedian: Colors.black,
      ),
    );
  }

  Widget _buildMonitoringCard(IconData icon, String type, String value,
      String date, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(type),
        subtitle: Text(date),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit, color: Colors.teal),
              onPressed: () {
                _showEditDialog(context, type, value, date);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _showDeleteDialog(context, type);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, String type, String value, String date) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar $type'),
          content: Text('Editar a entrada de $type em $date'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext context, String type) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Excluir $type'),
          content: Text('Você tem certeza que deseja excluir a entrada de $type?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Excluir'),
            ),
          ],
        );
      },
    );
  }
}

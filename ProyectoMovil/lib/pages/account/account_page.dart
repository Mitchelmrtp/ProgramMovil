import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'account_controller.dart';

class AccountPage extends StatelessWidget {
  final AccountController controller = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Colors.teal[800],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            _buildProfileAvatar(),
            SizedBox(height: 24),
            Text(
              'Aquí encontrarás tus datos personales',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            SizedBox(height: 24),
            _buildProfileItem(Icons.person, 'Nombre', controller.exampleWelcomeData.nombre),
            _buildProfileItem(Icons.person, 'Apellido', controller.exampleWelcomeData.apellidos),
            _buildProfileItem(Icons.credit_card, 'DNI', controller.exampleWelcomeData.dni),
            _buildProfileItem(Icons.event, 'Fecha de nacimiento', controller.exampleWelcomeData.fechaNacimiento),
            _buildProfileItem(Icons.phone, 'Teléfono', controller.exampleWelcomeData.telefono),
            _buildProfileItem(Icons.email, 'Email', controller.exampleWelcomeData.correo),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[300],
      ),
      child: Icon(
        Icons.person,
        size: 60,
        color: Colors.grey[600],
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.teal[800],
            size: 20,
          ),
          SizedBox(width: 8),
          Text(
            title + ':',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              initialValue: value,
              readOnly: true, // Hace que el campo de texto sea de solo lectura
              style: TextStyle(color: Colors.grey[600]),
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.edit,
                  color: Colors.teal[800],
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

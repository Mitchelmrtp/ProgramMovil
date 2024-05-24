import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginController control = Get.put(LoginController());

  Widget _buildBody(BuildContext context) {
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return SafeArea(
        child: Stack(
      children: [
        Container(
          color: Color.fromARGB(255, 255, 255, 255),
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.all(
              0.0), // Margen inferior de 20.0 (puedes ajustar este valor)
          alignment: Alignment.centerLeft,
        ),
        Column(
          children: [
            Expanded(
              flex: 2,
              child: _image(context),
            ),
            Expanded(flex: 1, child: Text('')),
          ],
        ),
        _form(context, isKeyboardOpen),
      ],
    ));
  }

  Widget _image(context) {
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Container(
         margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.0, // Margen izquierdo
              MediaQuery.of(context).size.width *
                  (isKeyboardOpen ? 0.0001 : 0.1), // Margen superior
              MediaQuery.of(context).size.width * 0.0, // Margen derecho
              MediaQuery.of(context).size.width * 0.8 // Margen inferior
            ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login.png'),
          ),
        ),
        child: null);
  }
  


  Widget _form(BuildContext context, bool isKeyboardOpen) {
    return SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(255, 255, 255, 255), // Color del borde
                width: 0.0, // Ancho del borde
              ),
              color: Color.fromARGB(255, 251, 251, 253),
            ),
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.05, // Margen izquierdo
              MediaQuery.of(context).size.width *
                  (isKeyboardOpen ? 0.4 : 0.6), // Margen superior
              MediaQuery.of(context).size.width * 0.05, // Margen derecho
              MediaQuery.of(context).size.width * 0.1, // Margen inferior
            ),
            constraints: BoxConstraints(
              minHeight: 320, // Altura mínima del contenido
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('¡Bienvenido al mundo del tiempo!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                SizedBox(height: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextFormField(
                      
                      style: TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        labelText: 'Usuario', // Etiqueta del campo de texto
                        labelStyle: TextStyle(color: Colors.black),
                        border: UnderlineInputBorder(), // Borde del campo de texto
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  Colors.black), // Color del borde al enfocar
                        ),
                      ),
                      controller: control.userController,
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                        style: TextStyle(fontSize: 16),
                        decoration: const InputDecoration(
                          labelText: 'Contraseña', // Etiqueta del campo de texto
                          labelStyle: TextStyle(color: Colors.black),
                          border: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.zero), // Borde del campo de texto
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black), // Color del borde al enfocar
                          ),
                        ),
                        controller: control.passwordController,
                        obscureText: true,
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() => control.message.value == ''
                        ? SizedBox(
                            height: 20,
                          )
                        : Column(children: [
                            Text(
                              control.message.value,
                              style:
                                  TextStyle(color: control.messageColor.value),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ])),
                    SizedBox(
                      height: 60,
                      width: double.infinity, // Ocupar todo el ancho disponible
                      child: TextButton(
                        onPressed: () {
                          // Función que se ejecuta cuando se presiona el botón
                          print('Botón presionado');
                          control.login(context);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              Color(0XFF31A062), // Color de fondo del botón
                          padding: EdgeInsets
                              .zero, // Padding cero para eliminar el espacio interno
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius
                                .circular(20), // Bordes cero para eliminar los bordes
                          ),
                        ),
                        child: Text(
                          'Iniciar sesión',
                          style: TextStyle(
                            color: Colors.white, // Color del texto
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),

                      SizedBox(
                      height: 20,
                    ),

                      SizedBox(
                      height: 60,
                      width: double.infinity, // Ocupar todo el ancho disponible
                      child: TextButton(
                        onPressed: () {
                          // Función que se ejecuta cuando se presiona el botón
                          print('Botón presionado');
                          control.goToSignIn(context);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              Color(0XFF31A062), // Color de fondo del botón
                          padding: EdgeInsets
                              .zero, // Padding cero para eliminar el espacio interno
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius
                                .circular(20), // Bordes cero para eliminar los bordes
                          ),
                        ),
                        child: Text(
                          'Crea tu cuenta',
                          style: TextStyle(
                            color: Colors.white, // Color del texto
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: _buildBody(context),
    ));
  }
}

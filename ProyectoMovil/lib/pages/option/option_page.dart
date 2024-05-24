import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeapp/pages/inicio/inicio_page.dart';
import 'package:timeapp/pages/productos/gridview_controller.dart';
import 'package:timeapp/pages/productos/gridview_page.dart';
import 'package:timeapp/pages/slider/slider_page.dart';

import 'package:timeapp/pages/widgets/constants.dart';
import 'option_controller.dart';

class OptionPage extends StatelessWidget {
  final OptionController control = Get.put(OptionController());

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Text('Menú'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kscaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8), // Ajusté el valor del padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SliderPage(),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Ofertas para ti",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("ver más"),
                    ),
                  ],
                ),
                GridView.builder(
                  shrinkWrap: true, // Agregué esta propiedad
                  physics: NeverScrollableScrollPhysics(), // Agregué esta propiedad
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductGrid(product: products[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'pizza.dart';

class PizzaDetail extends StatelessWidget {
  final Pizza pizzaSelected;

  const PizzaDetail({Key? key, required this.pizzaSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pizzaSelected.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              pizzaSelected.title,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Image.asset(
              "assets/images/${pizzaSelected.url_img}",
              width: 200,
            ),
            SizedBox(height: 12),
            Text(
              pizzaSelected.fullDescription,
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
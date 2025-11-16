import 'package:flutter/material.dart';
import 'pizza.dart';
import 'pizza_detail.dart';

final List<Pizza> listReceptionPizza = [
  Pizza(
    "Маргарита",
    "Кукурудза, томати, сир, курка, ананас",
    "Інгредієнти:\n Основа піци: Борошно — 500 г, Дріжджі свіжі — 15 г, Олія — 50 мл, Вода — 320 мл, Сіль за смаком\n\n"
    "Начинка:\n Помідори — 6 шт., Часник — 2 зубчики, Олія — 50 мл, Твердий сир — 250 г, Зелень — за смаком\n\n"
    "Приготування:\n"
    "1. Замісити тісто.\n"
    "2. Залишити підходити на 1 годину.\n"
    "3. Розкачати, викласти соус і начинку.\n"
    "4. Випікати 15-20 хв при 220°C.",
    "margarita.jpg",
  ),
  Pizza(
    "М'ясна",
    "Курка, бекон, ковбаски, сир",
    "Інгредієнти:\n Тісто: 500 г борошна, 15 г дріжджів, 320 мл води, 50 мл олії, сіль за смаком\n\n"
    "Начинка:\n Курка — 150 г, бекон — 100 г, мисливські ковбаски — 100 г, сир — 150 г\n\n"
    "Приготування:\n"
    "1. Замісити тісто.\n"
    "2. Дати підійти 1 годину.\n"
    "3. Розкачати, викласти м'ясну начинку і сир.\n"
    "4. Випікати 15-20 хв при 220°C.",
    "meet_pizza.jpg",
  ),
  Pizza(
    "Чотири сири",
    "Чедер, Мацарела, Фетта, Рокфорд",
    "Інгредієнти:\n Тісто: 500 г борошна, 15 г дріжджів, 320 мл води, 50 мл олії, сіль за смаком\n\n"
    "Начинка:\n Чедер — 50 г, Мацарела — 50 г, Фетта — 50 г, Рокфорд — 50 г\n\n"
    "Приготування:\n"
    "1. Замісити тісто.\n"
    "2. Дати підійти 1 годину.\n"
    "3. Розкачати, викласти суміш сирів на тісто.\n"
    "4. Випікати 15-20 хв при 220°C.",
    "four_cheese.jpg",
  ),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Pizza App',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Scaffold(
        appBar: AppBar(title: Text("Список піц")),
        body: ListDinamicPizza(listPizza: listReceptionPizza),
      ),
    );
  }
}

class ListDinamicPizza extends StatelessWidget {
  final List<Pizza> listPizza;
  const ListDinamicPizza({Key? key, required this.listPizza}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: listPizza.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Image.asset(
            "assets/images/${listPizza[index].url_img}",
            width: 50,
          ),
          title: Text(listPizza[index].title, style: TextStyle(fontSize: 22)),
          subtitle: Text("Склад: ${listPizza[index].description}"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PizzaDetail(pizzaSelected: listPizza[index]),
              ),
            );
          },
        );
      },
    );
  }
}
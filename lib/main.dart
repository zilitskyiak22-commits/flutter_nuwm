import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Список назв піц
final List<String> pizza = <String>[
  "Маргарита",
  "М'ясна",
  "Чотири сири",
  "Гавайська",
  "Пепероні",
];

// Короткий опис кожної піци
final List<String> receptPizza = <String>[
  "Кукурудза, томати, сир, курка, ананас",
  "Бекон, мисливські ковбаски, сир",
  "Чедер, Мацарела, Фетта, Рокфорд",
  "Курка, ананас, сир моцарела",
  "Пепероні, томатний соус, сир",
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
        appBar: AppBar(
          title: Text("Список піц"),
        ),
        body: ListDinamicPizza(),
      ),
    );
  }
}

class ListDinamicPizza extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: pizza.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Icon(Icons.local_pizza, size: 28, color: Colors.orange),
          title: Text(
            pizza[index],
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          subtitle: Text("Склад: ${receptPizza[index]}"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Виведення у консоль
            print("Вибрано піцу: ${pizza[index]}");

            // Виведення спливаючого повідомлення через FlutterToast
            Fluttertoast.showToast(
              msg: "Ви обрали: ${pizza[index]}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
        );
      },
    );
  }
}

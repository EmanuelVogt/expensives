import 'package:flutter/material.dart';
import './Models/transaction.dart'; // Adicionado ponto-e-vírgula

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue, // Explicitamente definindo cor
          foregroundColor:
              Colors.white, // Garantindo visibilidade do texto/ícones
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final _transactions = [
    Transaction(
        id: '1', title: 'Nova transaction', value: 2.2, date: DateTime.now()),
    Transaction(
        id: '2', title: 'Outra transaction', value: 3.5, date: DateTime.now())
  ];

  String formatDate(DateTime date) {
    String day =
        date.day.toString().padLeft(2, '0'); // Garante dois dígitos para o dia
    String month = date.month
        .toString()
        .padLeft(2, '0'); // Garante dois dígitos para o mês
    String year = date.year.toString(); // Ano em formato de quatro dígitos
    return '$day/$month/$year'; // Formata a data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Standard Blue AppBar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('Gráfico'),
            ),
          ),
          Column(
            children: _transactions.map((tr) {
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'R\$ ${tr.value}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.blue),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tr.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18)),
                            Text(formatDate(tr.date))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

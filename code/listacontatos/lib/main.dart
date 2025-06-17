import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Contatos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'Contatos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> contatos = [
    {'nome': 'Ana Silva', 'telefone': '(11) 99999-0001'},
    {'nome': 'Bruno Souza', 'telefone': '(11) 99999-0002'},
    {'nome': 'Carla Mendes', 'telefone': '(11) 99999-0003'},
    {'nome': 'Daniel Costa', 'telefone': '(11) 99999-0004'},
    {'nome': 'Eduardo Lima', 'telefone': '(11) 99999-0005'},
    {'nome': 'Fernanda Rocha', 'telefone': '(11) 99999-0006'},
    {'nome': 'Gustavo Almeida', 'telefone': '(11) 99999-0007'},
    {'nome': 'Helena Martins', 'telefone': '(11) 99999-0008'},
    {'nome': 'Igor Ferreira', 'telefone': '(11) 99999-0009'},
    {'nome': 'Juliana Castro', 'telefone': '(11) 99999-0010'},
    {'nome': 'Lucas Pereira', 'telefone': '(11) 99999-0011'},
    {'nome': 'Mariana Oliveira', 'telefone': '(11) 99999-0012'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 26, 39),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 26, 39),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                Text(
                  '${contatos.length} contatos',
                  style: const TextStyle(color: Colors.white, fontSize: 11.0),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.search, color: Colors.white),
            const Icon(Icons.more_vert, color: Colors.white),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 0.5,
            decoration: BoxDecoration(color: Colors.grey[700]),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contatos.length,
              itemBuilder: (context, index) {
                final contato = contatos[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Text(
                      contato['nome']![0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    contato['nome']!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    contato['telefone']!,
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ContactDetailsPage(nome: contato['nome']!),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ContactDetailsPage extends StatelessWidget {
  final String nome;

  const ContactDetailsPage({super.key, required this.nome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 26, 39),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 26, 39),
        title: Text(nome, style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Text(
          'Detalhes de $nome',
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

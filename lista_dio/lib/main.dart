import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contato> contatos = [];

  @override
  void initState() {
    super.initState();

    contatos.add(new Contato(
        nome: "Nereu", telefone: "51995891268", tipo: ContatoType.CELULAR));

    contatos.add(new Contato(
        nome: "Mariel - CASA", telefone: "5136322121", tipo: ContatoType.CASA));

    contatos.add(new Contato(
        nome: "Patricia", telefone: "51995891268", tipo: ContatoType.CASA));

    contatos.add(new Contato(
        nome: "Julia", telefone: "51995891268", tipo: ContatoType.CASA));

    contatos.sort((a, b) => a.nome.compareTo(b.nome));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          var contato = contatos[index];
          return Container(
            child: ListTile(
              title: Text(contato.nome),
              subtitle: Text(contato.telefone),
              leading: CircleAvatar(
                child: ContatoHelper.getIconContatoType(contato.tipo),
                backgroundColor: Colors.blue[200],
              ),
              trailing: IconButton(
                icon: Icon(Icons.call),
                onPressed: (){},
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: contatos.length,
      ),
    );
  }
}

class Contato {
  final String nome;
  final String telefone;
  final ContatoType tipo;

  Contato({
    @required this.nome,
    @required this.telefone,
    @required this.tipo,
  });
}

enum ContatoType { CELULAR, TRABALHO, FAVORITO, CASA }

class ContatoHelper{
  static Icon getIconContatoType(ContatoType type){
    switch(type){
      case ContatoType.CELULAR:
        return Icon(Icons.phone_android, color: Colors.green[700]);
      case ContatoType.TRABALHO:
        return Icon(Icons.work, color: Colors.brown[500]);
      case ContatoType.FAVORITO:
        return Icon(Icons.star, color: Colors.yellow[600]);
      case ContatoType.CASA:
        return Icon(Icons.home, color: Colors.purple[600]);

    }
  }

}

import 'package:flutter/material.dart';
import 'objetos.dart';
import 'api_client.dart';

class NuevoProyecto extends StatelessWidget{
  final String userId;
  const NuevoProyecto(this.userId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: Color(0xFFE6E6E6),
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text("Nuevo Proyecto"),
          ),
          body: Center(
            child: getWidget(context, userId),
          ),
        )
    );
  }

  static final nombre = TextEditingController();
  static final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  static Widget getWidget(context, userId){
    return Center(
      child: ListView(
          children: [Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 30),
              const Text(
                'Nuevo proyecto',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF004374),
                ),
              ),
              const SizedBox(height: 30),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.8,
                child: _name(),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.8,
                child: ElevatedButton(
                  onPressed: () async{
                    Proyecto proyecto = Proyecto.fromNombre(nombre.text);
                    print(proyecto.toJson());
                    var api = ApiClient();
                    api.nuevoProyecto(proyecto, userId);
                  },
                  style: style,
                  child: const Text("Aceptar"),
                ),
              ),
            ],
          ),
          ]),
    );
  }

  static TextFormField _name(){
    return TextFormField(
      style: const TextStyle(fontSize: 20),
      decoration: const InputDecoration(
        hintText: "Nombre del proyecto",
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
      controller: nombre,
    );
  }





}

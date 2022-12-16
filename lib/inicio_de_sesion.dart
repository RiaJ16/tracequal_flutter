import 'proyectos.dart';
import 'package:flutter/material.dart';
import 'api_client.dart';


class InicioDeSesion extends StatelessWidget{
  const InicioDeSesion({Key? key}) : super(key: key);

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
            title: const Text("Inicio de sesión"),
          ),
          body: Center(
            child: getWidget(context),
          ),
        )
    );
  }

  static final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  static final username = TextEditingController();
  static final password = TextEditingController();

  static Widget getWidget(context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Tracequal',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Color(0xFF004374),
            ),
          ),
          const SizedBox(height: 90),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.5,
            child: _username(),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.5,
            child: _password(),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.5,
            child: ElevatedButton(
              onPressed: () async{
                var api = ApiClient();
                var respuesta = await api.login(username.text, password.text);
                //if(respuesta.login){
                if(true){
                  print("yes");
                  var proyectos = await api.consultarProyectos(respuesta.usuario.id);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                      Proyectos(proyectos, respuesta.usuario.id))
                  );
                }
                else{

                }
              },
              style: style,
              child: const Text("Iniciar sesión"),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacementNamed(context, '/registro');
            },
            child: const Text(
                "Registro",
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
            ),
          ),
        ],
      ),
    );
  }

  static Container _username(){
    return Container(
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            hintText: "Usuario",
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
          controller: username,
        )
    );
  }

  static Container _password(){
    return Container(
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            hintText: "Contraseña",
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          controller: password,
        )
    );
  }

}

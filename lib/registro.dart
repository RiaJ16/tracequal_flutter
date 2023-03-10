import 'package:flutter/material.dart';


class Registro extends StatelessWidget{

  const Registro({Key? key}) : super(key: key);

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
            title: const Text("Registro"),
          ),
          body: Center(
            child: getWidget(context),
          ),
        )
    );
  }

  static final username = TextEditingController();
  static final nombre = TextEditingController();
  static final apepat = TextEditingController();
  static final apemat = TextEditingController();
  static final email = TextEditingController();
  static final password = TextEditingController();
  static final password2 = TextEditingController();

  static final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  static Widget getWidget(context){
    return Center(
      child: ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            const Text(
                'Registro',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF004374),
                ),
              ),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              child: _username(),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              child: _name(),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              child: _lastname(),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              child: _lastname2(),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              child: _email(),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              child: _password(),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              child: _confirm_password(),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              child: ElevatedButton(
                onPressed: (){},
                style: style,
                child: const Text("Aceptar"),
              ),
            ),
          ],
        ),
      ]),
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

  static Container _name(){
    return Container(
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            hintText: "Nombre(s)",
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
          controller: nombre,
        )
    );
  }

  static Container _lastname(){
    return Container(
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            hintText: "Apellido paterno",
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
          controller: apepat,
        )
    );
  }

  static Container _lastname2(){
    return Container(
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            hintText: "Apellido materno",
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
          controller: apemat,
        )
    );
  }

  static Container _email(){
    return Container(
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            hintText: "Correo electr??nico",
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
          controller: email,
        )
    );
  }

  static Container _password(){
    return Container(
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            hintText: "Contrase??a",
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

  static Container _confirm_password(){
    return Container(
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            hintText: "Confirmar contrase??a",
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          controller: password2,
        )
    );
  }

}

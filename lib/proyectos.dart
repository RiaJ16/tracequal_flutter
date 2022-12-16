import 'package:flutter/material.dart';
import 'objetos.dart';
import 'proyecto_overview.dart';
import 'nuevo_proyecto.dart';


class Proyectos extends StatefulWidget {
  final List<Proyecto> proyectos;
  final String userId;
  const Proyectos(this.proyectos, this.userId, {Key? key}) : super(key: key);

  @override
  State<Proyectos> createState() => _ProyectosState();
}

class _ProyectosState extends State<Proyectos>{

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
            title: const Text("Proyectos"),
          ),
          body: Center(
            child: getWidget(context),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      NuevoProyecto(widget.userId))
              );
            },
          ),
        )
    );
  }

  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  Widget getWidget(context){
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            const Text(
                'Proyectos',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF004374),
                ),
              ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10,10,10,10),
                width: double.maxFinite,
                child: Card(
                  child: /*ListView(
                    children: [
                      _proyecto(widget.proyectos[0].nombre),
                      _proyecto("Proyecto 2"),
                      _proyecto("Proyecto 3"),
                      _proyecto("Proyecto 4"),
                      _proyecto("Proyecto 5"),
                      _proyecto("Proyecto 6"),
                      _proyecto("Proyecto 7"),
                    ],
                  ),*/
                  ListView.builder(
                      itemCount: widget.proyectos.length,
                      itemBuilder: (BuildContext context, int index){
                        return
                          _proyecto(widget.proyectos[index]);
                      }
                  )
                ),
              ),
            ),
          ],
        ),
    );
  }

  GestureDetector _proyecto(Proyecto proyecto){
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10,10,10,10),
        height: 100,
        width: double.maxFinite,
        child: Card(
          child: Container(
            color: const Color(0xFFF5F5F5),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 12,
                  child: Text(
                    proyecto.nombre,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF004374),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    proyecto.fechaDeIngreso,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                ProyectoOverview(proyecto))
        );
      },
    );
  }

}

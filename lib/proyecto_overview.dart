import 'package:flutter/material.dart';
import 'objetos.dart';

class ProyectoOverview extends StatefulWidget {
  final Proyecto proyecto;

  const ProyectoOverview(this.proyecto, {Key? key}) : super(key: key);

  @override
  State<ProyectoOverview> createState() => _ProyectoOverviewState();
}

class _ProyectoOverviewState extends State<ProyectoOverview>{

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
            title: Text(widget.proyecto.nombre),
          ),
          body: Center(
            child: getWidget(context),
          ),
        )
    );
  }

  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  Widget getWidget(context) {
    Progreso progreso = widget.proyecto.progreso;
    double completado = (progreso.progresoRequisitos + progreso.progresoCodigo
        + progreso.progresoDiseno + progreso.progresoPruebas) / 4;
    double porcentaje = completado * .01;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.proyecto.nombre,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xFF004374),
            ),
          ),
          Card(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                height: 50,
                child: Row(
                  children: [Expanded(
                    flex: 17,
                    child: _barraDeProgreso(porcentaje),
                  ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "${completado.toInt()}%",
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                )
            ),
          ),
          Row(
            children:[
              Expanded(
                child: _artefactoSinBarra("Historias de Usuario"),
              )
            ],
          ),
          Row(
            children:[
              Expanded(
                child: _artefacto("Requisitos", progreso.progresoRequisitos),
              ),
              Expanded(
                child: _artefacto("Diseñ o", progreso.progresoDiseno),
              ),
            ],
          ),
          Row(
            children:[
              Expanded(
                child: _artefacto("Codigo", progreso.progresoCodigo),
              ),
              Expanded(
                child: _artefacto("Pruebas", progreso.progresoPruebas),
              ),
            ],
          ),
        ],
      ),
    );
  }

  LinearProgressIndicator _barraDeProgreso(double porcentaje){
    return LinearProgressIndicator(
      value: porcentaje,
      backgroundColor: Colors.grey[300],
      minHeight: 15,
      color: porcentaje <= .25
          ? Colors.red
          : porcentaje <= .5
          ? Colors.orange
          : porcentaje <= .75
          ? Colors.yellow
          : Colors.green,
    );
  }

  GestureDetector _artefacto(String nombre, int progreso){
    double porcentaje = progreso * .01;
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        height: 100,
        width: double.maxFinite,
        child: Card(
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: Text(
                  nombre,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF004374),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: _barraDeProgreso(porcentaje)
              ),
            ],
          ),
        ),
      ),
      onTap: (){
        /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                ProyectoOverview(proyecto))
        );*/
      },
    );
  }

  GestureDetector _artefactoSinBarra(String nombre){
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        height: 100,
        width: double.maxFinite,
        child: Card(
          child: Column(
            children: [Text(
                nombre,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF004374),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: (){
        /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                ProyectoOverview(proyecto))
        );*/
      },
    );
  }
}

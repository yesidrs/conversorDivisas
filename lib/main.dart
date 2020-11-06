import 'package:flutter/material.dart';

void main() {
  runApp(MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget x = MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Center(
          child: PaginaPrincipal(),
        ));
    return x;
  }
}

class PaginaPrincipal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaContador();
}

class _PaginaContador extends State<PaginaPrincipal> {
  //lista
  String valorMoneda1 = 'Seleccionar moneda';
  List<String> opcionMonedas = <String>[
    'Seleccionar moneda',
    'Dolar',
    'COP',
    'Euro',
    'Sol'
  ];

  @override
  Widget build(BuildContext context) {
    return esquema1();
  }

  Scaffold esquema1() {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(86, 226, 151, 1),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.attach_money),
              ),
            ],
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.euro_symbol),
            ),
            title: Text('CONVERTIDOR DIVISAS')),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Container(
                color: Color.fromRGBO(221, 228, 224, 1),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Convertir de',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    DropdownButton<String>(
                      value: valorMoneda1,
                      items: opcionMonedas
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String nuevoValor) {
                        setState(() {
                          valorMoneda1 = nuevoValor;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'A',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    DropdownButton<String>(
                      value: valorMoneda1,
                      items: opcionMonedas
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String nuevoValor) {
                        setState(() {
                          valorMoneda1 = nuevoValor;
                        });
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: false,
                            prefixIcon: Icon(
                              Icons.monetization_on,
                              color: Colors.black,
                            ),
                            labelText: 'Valor *',
                            labelStyle: TextStyle(color: Colors.black),
                            fillColor: Colors.black)),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: RaisedButton(
                        child: Text(
                          'CALCULAR',
                          style: TextStyle(fontSize: 17),
                        ),
                        onPressed: () {
                          //Aqui se llama al metodo que realiza la logica de negocio
                        },
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        color: Color.fromRGBO(86, 226, 151, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white10,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Resultado',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(
                      height: 45.0,
                    ),
                    Text(
                      '130.000',
                      style: TextStyle(fontSize: 80.0),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.black,
                alignment: Alignment.center,
                child: const Text(
                  '2020',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}

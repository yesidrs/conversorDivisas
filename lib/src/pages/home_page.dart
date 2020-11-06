import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterPage();
}

class _CounterPage extends State<HomePage> {
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
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: _body(),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Color.fromRGBO(86, 226, 151, 1),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.attach_money),
          onPressed: () => {},
        ),
      ],
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.euro_symbol),
        onPressed: () => {},
      ),
      title: Text('CONVERTIDOR DIVISAS'),
    );
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        Container(
          color: Color(0xffE5E7E9),
          child: Column(
            children: [
              _dropdownsCoins(),
              _inputValue(),
              _btnCalculate(),
            ],
          ),
        ),
        _result(),
      ],
    );
  }

  Widget _dropdownsCoins() {

    final marginTop = EdgeInsets.only(top: 20);

    return Container(
      margin: marginTop,
      child: Column(
        children: [
          Text(
            'Convertir de',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontStyle: FontStyle.normal,
            ),
          ),
          Container(
            margin: marginTop,
            child: DropdownButton<String>(
              value: valorMoneda1,
              items: opcionMonedas.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (String nuevoValor) {
                setState(() {
                  valorMoneda1 = nuevoValor;
                });
              },
            ),
          ),
          Container(
            margin: marginTop,
            child: Text(
              'A',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          Container(
            margin: marginTop,
            child: DropdownButton<String>(
              value: valorMoneda1,
              items: opcionMonedas.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (String nuevoValor) {
                setState(() {
                  valorMoneda1 = nuevoValor;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _inputValue() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      margin: EdgeInsets.symmetric(vertical: 50),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          filled: false,
          prefixIcon: Icon(Icons.monetization_on, color: Colors.black),
          labelText: 'Valor *',
          labelStyle: TextStyle(color: Colors.black),
          fillColor: Colors.black,
        ),
      ),
    );
  }

  Widget _btnCalculate() {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      child: RaisedButton(
        child: Text(
          'CALCULAR',
          style: TextStyle(fontSize: 17),
        ),
        onPressed: () {
          //Aqui se llama al metodo que realiza la logica de negocio
        },
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        color: Color.fromRGBO(86, 226, 151, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _result() {
    return Container(
      color: Colors.white10,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Resultado',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '130.000',
              style: TextStyle(fontSize: 80),
            ),
          )
        ],
      ),
    );
  }
}

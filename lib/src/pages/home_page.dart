import 'package:convertidor_divisas/src/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:convertidor_divisas/src/provider/api.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterPage();
}

class _CounterPage extends State<HomePage> {
  String coinPrimary = 'Seleccionar moneda';
  String coinSecond = 'Seleccionar moneda';
  String quantity;
  String result = '0';

  final valueController = TextEditingController();

  List<String> coinsOptions = <String>[
    'Seleccionar moneda',
    'USD',
    'COP',
    'EUR',
    'JPY'
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
              value: coinPrimary,
              items: coinsOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (String value) {
                setState(() {
                  coinPrimary = value;
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
              value: coinSecond,
              items: coinsOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (String value) {
                setState(() {
                  coinSecond = value;
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
      child: TextField(
        controller: valueController,
        keyboardType: TextInputType.number,
        autofocus: false,
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
        onPressed: () async {
          if (_validateButton()){
            final amount = await coinConvert(coinPrimary, coinSecond, quantity);
            setState(() {
              result = amount.toString();
            });
          }
        },
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        color: Color.fromRGBO(86, 226, 151, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  bool _validateButton() {
    if (coinPrimary == 'Seleccionar moneda' ||
        coinSecond == 'Seleccionar moneda') {
      toastError('Seleccione una moneda');
      return false;
    } 
    else if (coinPrimary == coinSecond) {
      toastError('Las monedas no pueder ser iguales');
      return false;
    } 
    else if (valueController.text.isEmpty) {
      toastError('Debe agregar un valor');
      return false;
    } 
    else {
      quantity = valueController.text;
      return true;
    }
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
              '$result',
              style: TextStyle(fontSize: 50),
            ),
          )
        ],
      ),
    );
  }
}

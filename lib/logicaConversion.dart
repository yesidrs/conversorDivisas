/*void main() {
  Logica().seleccionarMoneda();
}*/

class Logica {
  String monedaOrigen = 'Dolar';
  String monedaDestino = 'Euro';
  double tasaDolares_COP = 3800.0;

  setCantidadConvertir() {
    double cantidad = 50.0;
    return cantidad;
  }

  setMonedaOrigen(String moneda) {
    print('$moneda');
    return moneda;
  }

  setMonedaDestino(String moneda) {
    print('$moneda');
    return moneda;
  }

  seleccionarMoneda() {
    if (monedaOrigen == 'Dolar') {
    } else if (monedaOrigen == 'Euro') {
    } else if (monedaOrigen == 'Yen') {
    } else if (monedaOrigen == 'Peso') {}
  }

  realizarCalculoDolar() {
    double valorFinal = 0;
    valorFinal = tasaDolares_COP * setCantidadConvertir();
    print("elo");
    print("$valorFinal");
  }
}

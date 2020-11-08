import 'dart:convert';

ConvertResponse convertResponseFromJson(String str) =>
    ConvertResponse.fromJson(json.decode(str));

String convertResponseToJson(ConvertResponse data) =>
    json.encode(data.toJson());

class ConvertResponse {
  Result result;
  
  ConvertResponse({
    this.result,
  });

  factory ConvertResponse.fromJson(Map<String, dynamic> json) =>
      ConvertResponse(
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class Result {
  double amount;

  Result({
    this.amount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        amount: json["amount"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
      };
}

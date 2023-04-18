import 'dart:convert';

import 'package:http/http.dart';

const apiURL = 'https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD&fbclid=IwAR27K7uSi4G5LIGwGQZMcaThcNP-e9U5Eb2FLhzQNya5oL-m_gNgIf5VhC8';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinDataBTC {
  final String apiURL;
  CoinDataBTC(this.apiURL);
  Future getCoinData(String selectedCurrency) async{
    var response = await get(Uri.parse(apiURL));
   if(response.statusCode  == 200 ){
     var decodeData = jsonDecode(response.body);
     var lastPrice = decodeData[selectedCurrency];
     return lastPrice;
   } else {
     print(response.statusCode);

     throw 'Problem with the get request.';
   }
  }
}
class CoinDataETH {
  final String apiURL;
  CoinDataETH(this.apiURL);
  Future getCoinData(String selectedCurrency) async{
    var response = await get(Uri.parse(apiURL));
    if(response.statusCode  == 200 ){
      var decodeData = jsonDecode(response.body);
      var lastPrice = decodeData[selectedCurrency];
      return lastPrice;
    } else {
      print(response.statusCode);

      throw 'Problem with the get request.';
    }
  }
}
class CoinDataLTC {
  final String apiURL;
  CoinDataLTC(this.apiURL);
  Future getCoinData(String selectedCurrency) async{
    var response = await get(Uri.parse(apiURL));
    if(response.statusCode  == 200 ){
      var decodeData = jsonDecode(response.body);
      var lastPrice = decodeData[selectedCurrency];
      return lastPrice;
    } else {
      print(response.statusCode);

      throw 'Problem with the get request.';
    }
  }
}

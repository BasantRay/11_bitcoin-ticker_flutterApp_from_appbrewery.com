import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;



class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  @override
  void initState() {
    super.initState();
    getCryptoCurrencyBTC();
    getCryptoCurrencyETH();
    getCryptoCurrencyLTC();
  }

  String selectedCurrency = 'AUD';

  DropdownButton<dynamic> androiDropDown(){
      List<DropdownMenuItem<String>> dropdownItems = [];
      for (String currency in currenciesList) {
        var newItem = DropdownMenuItem(
          child: Text(currency),
          value: currency,
        );
        dropdownItems.add(newItem);
      }

      return DropdownButton <dynamic>(
        value: selectedCurrency,
        items: dropdownItems,
        onChanged: (value){
        setState(() {
          selectedCurrency = value!;
          getCryptoCurrencyBTC();
          getCryptoCurrencyETH();
          getCryptoCurrencyLTC();
        });
      },
      );
  }
  CupertinoPicker iOSPicker(){

    List<Text> itemPickers = [];

    for(String currency in currenciesList){
      itemPickers.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 35.0,
      onSelectedItemChanged: (selectedIndex) {
      },
      children: itemPickers,
    );
  }
  Widget getsPicker(){
    if(Platform.isIOS){
      return iOSPicker();} else if(Platform.isAndroid){
      return androiDropDown();
    }
    return getsPicker();
  }

  String? bitCOin = ' ';
  String? etcData = '';
  String? ltcData = '';

  void getCryptoCurrencyBTC()async{

    CoinDataBTC coinData = CoinDataBTC(
        'https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=$selectedCurrency&fbclid=IwAR27K7uSi4G5LIGwGQZMcaThcNP-e9U5Eb2FLhzQNya5oL-m_gNgIf5VhC8'
    );
    try{
      num coinDATA = await coinData.getCoinData(selectedCurrency);
      setState(() {
            });
      bitCOin  = coinDATA.toStringAsFixed(0);


    }catch(e){
      print(e);
    }
  }
  void getCryptoCurrencyETH()async{
    CoinDataETH coinDataETH = CoinDataETH('https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=$selectedCurrency&fbclid=IwAR27K7uSi4G5LIGwGQZMcaThcNP-e9U5Eb2FLhzQNya5oL-m_gNgIf5VhC8'
    );
    try{
      num coindataETH = await coinDataETH.getCoinData(selectedCurrency);
      setState(() {
        etcData = coindataETH.toStringAsFixed(0);
      });
    }catch(e){
      print(e);
    }
  }
  void getCryptoCurrencyLTC()async{
    CoinDataLTC coinDataLTC = CoinDataLTC('https://min-api.cryptocompare.com/data/price?fsym=LTC&tsyms=$selectedCurrency&fbclid=IwAR27K7uSi4G5LIGwGQZMcaThcNP-e9U5Eb2FLhzQNya5oL-m_gNgIf5VhC8'
    );
    try{
      num coindataLTC = await coinDataLTC.getCoinData(selectedCurrency);
      setState(() {
        ltcData = coindataLTC.toStringAsFixed(0);
      });
    }catch(e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CryptoCards(cryptoCurrency: 'BTC',bitCOin: bitCOin, selectedCurrency: selectedCurrency),
              CryptoCards(cryptoCurrency: 'ETH',bitCOin: etcData, selectedCurrency: selectedCurrency),
              CryptoCards(cryptoCurrency: 'LTC',bitCOin: ltcData, selectedCurrency: selectedCurrency),
            ],
          ),


          Column(
            children:[ Container(
                height: 150.0,
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 30.0),
                color: Colors.lightBlue,
                child: Platform.isIOS ? iOSPicker() : androiDropDown(),
            ),
            ]
          ),
        ],
      ),
    );
  }
}

class CryptoCards extends StatelessWidget {
  const CryptoCards({
    super.key,
    required this.bitCOin,
    required this.selectedCurrency,
    required this.cryptoCurrency,
  });

  final String? bitCOin;
  final String selectedCurrency;
  final String cryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency = $bitCOin $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:bitcoin_ticker/controller/CoinTickerBrain.dart';
import 'package:bitcoin_ticker/utilities/SharedPref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'view/screens/price_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CoinTickerBrain.updateCryptoStatusFromSharedPreferences();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepOrange,
        accentColor: Colors.red,
        scaffoldBackgroundColor: Colors.grey[900],
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.orange
        )
      ),
      home: PriceScreen(),
    );
  }
}

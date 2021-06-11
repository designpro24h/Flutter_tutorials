import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class MyApp extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return  _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  String _content;
  double _amount;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test thư xem ne',
     home: Scaffold(
       key: _scaffoldKey,
       body: SafeArea(
         minimum: const EdgeInsets.only(left: 20, right: 20),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             TextField(
               decoration: InputDecoration(labelText:'Content'),
               controller: _contentController,
               onChanged: (text) {
                 setState(() {
                   _content = text;
                 });
               },
             ),
             TextField(
               decoration: InputDecoration(labelText: 'Amount(money)'),
               controller: _amountController,
               onChanged: (text) {
                 setState(() {
                   _amount = double.tryParse(text) ?? 0;
                 });
               },
             ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 10),
             ),
             ButtonTheme(
               height: 40,
                 child: FlatButton(

                   child: Text('Insert Transaction',style: const TextStyle(fontSize: 18)),
                   color: Colors.blue,
                   textColor: Colors.white,
                   onPressed: () {
                     _scaffoldKey.currentState.showSnackBar(
                         SnackBar(
                           content: Text('Content = $_content, money\'s amount = $_amount'),
                           duration: Duration(seconds: 3),
                         )
                     );

                   },

                 )
             )
           ],
         ),
       ),
     )
    );
  }
}

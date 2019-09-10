import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Cards And AlertBox';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),
        backgroundColor: Colors.red,
        ),
        body: MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(10.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
                color: Colors.black12,
                offset: new Offset(0.0, 10.0),
                blurRadius: 10.0
            )
          ]
        ),
      child: new Card(
        elevation: 10,
        child: new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text("Earphones"),
                subtitle: Text("Wired/Wireless"),
              ),
              ButtonTheme.bar(
                child: ButtonBar(
                  children: <Widget>[
                  FlatButton(
                    child: const Text("Add to Cart"),
                    textColor: Colors.pink,
                    onPressed: (){
                      String alert="add to cart";
                      _showAlertDialog(context,alert);},
                  ),
                  FlatButton(
                    child: const Text("Buy"),
                    textColor: Colors.pink,
                    onPressed: (){
                      String alert="buy it";
                      _showAlertDialog(context,alert);
                    },
                  )
                  ],
                )
              )
            ],
          ),
        ),    
      ),
    );
  }
  void _showAlertDialog(BuildContext context,String alert)
  {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context)
      {
        return AlertDialog(
          title: new Text("Are you sure you want to $alert"),
          content: new Text("its price is Rs.120"),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: new Text("Yes"),
            ),
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: new Text("No"),
            )
          ],
        );
      }
    );
  }
}
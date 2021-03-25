import 'package:flutter/material.dart';
import 'dart:math';


void main(){
  runApp(new MaterialApp(
    home: new Home(),
    routes: <String, WidgetBuilder>{
      '/Kalkulator' : (BuildContext context) => new Home(),
    },
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  int diagonal1 = 0;
  int diagonal2 = 0;
  String _jk="";

  void _pilihJk(String value){
    setState(() {
      _jk = value;
    });
  }

  var _nomor = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.menu, color : Colors.black12),
        title: new Text('MENGHITUNG LUAS BELAH KETUPAT'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.person, color : Colors.white),
            onPressed: (){
              Navigator.pushNamed(context, '/Profile');
            },
          )
        ],
      ),

      body: ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: _nomor,
                  maxLength: 25,
                  decoration: new InputDecoration(
                      labelText: "Nama",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0)
                      )
                  ),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20.0)),
                new TextField(
                  onChanged: (txt) {
                    setState(() {
                      diagonal1 = int.parse(txt);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: "Diagonal 1",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0)
                      )
                  ),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20.0)),
                new TextField(
                  onChanged: (txt) {
                    setState(() {
                      diagonal2 = int.parse(txt);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: "Diagonal 2",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0)
                      )
                  ),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20.0)),
                Container(
                  //height: double.infinity,
                  margin: EdgeInsets.only(left: 10,right: 10,bottom: 20),
                  child: RaisedButton(
                    onPressed: () {
                      var route = new MaterialPageRoute(
                        builder: (BuildContext) =>
                        new VOLUMEResult(nama : _nomor.text,Tdiagonal1: diagonal1,Tdiagonal2: diagonal2, jk: _jk),
                      );
                      Navigator.of(context).push(route);
                    },
                    padding: EdgeInsets.all(10.0),
                    color: Colors.lightGreen,
                    textColor: Colors.white,
                    child: Text(
                      'HITUNG',
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VOLUMEResult extends StatelessWidget {
  VOLUMEResult({@required this.Tdiagonal1, @required this.nama, @required this.Tdiagonal2, @required this.jk});
  final int Tdiagonal1;
  final int Tdiagonal2;
  final String nama;
  final String jk;
  int tLuas;
  String cLuas;
  int luas;
  @override
  Widget build(BuildContext context) {
    double volume = (0.5 * Tdiagonal1 * Tdiagonal2);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('HASIL'),
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20,child: Container(
              color: Colors.white,
            ),),
            new Text(
              "Halo ${nama} ,",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 10,child: Container(
              color: Colors.white,
            ),),
            Text(
              'LUAS BELAH KETUPAT ADALAH :',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            Text(
              ' $volume ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

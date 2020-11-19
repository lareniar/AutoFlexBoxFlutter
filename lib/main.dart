import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _itemCount = 10;
  int _filas = 1;
  int _columnas = 1;
  PageController _filasController;
  PageController _columnasController;

  @override
  void initState() {
    super.initState();
    _filasController = PageController();
    _columnasController = PageController();

    _filasController.addListener(() => _establecerFC());
    _columnasController.addListener(() => _establecerFC());
  }

  _establecerFC() {
    setState(() {
      _filas = _filasController.page.floor() + 1;
      _columnas = _columnasController.page.floor() + 1;
      print('$_filas, $_columnas');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
              child: PageView.builder(
                controller: _columnasController,
                itemBuilder: (context, page) {
                  return Center(child: Text("Filas $_filas"));
                },
                itemCount: _itemCount,
              ),
            ),
            Divider(),
            SizedBox(
              
              height: 50,
              child: PageView.builder(
                controller: _filasController,
                itemBuilder: (context, page) {
                  return Center(child: Text("Columnas $_columnas"));
                },
                itemCount: _itemCount,
              ),
            ),
            Divider(),
            Expanded(
                child: Row(
              children: [
                for (var i = 0; i < _filas; i++)
                  Expanded(
                    child: Column(children: [
                      for (var j = 0; j < _columnas; j++)
                        Expanded(flex: 1, child: Text('AAA')),
                    ]),
                  )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_crono_app/pages/Cronos.dart';
import 'package:provider/provider.dart';
import 'pages/Cronos.dart';
import 'package:provider/provider.dart';
import './store/cronos.store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CronosStore>(
          create: (_) => CronosStore(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Cronos(
          titulo: 'trabalho',
          valor: 25,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


/* import 'package:flutter_crono_app/store/contador.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
final store = ContadorStore();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (_) => Text(
                '${store.contador}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: store.incrementar,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
} */

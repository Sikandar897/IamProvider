import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_2/provider/count_provider.dart';

class Countexample extends StatefulWidget {
  const Countexample({super.key});

  @override
  State<Countexample> createState() => _CountexampleState();
}

//adding consumer widget the game changer which will only rebuild the text widget not overall ui

class _CountexampleState extends State<Countexample> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);  //provider ki ye property listen ko false kr ke pori ui ki widget ab dobra rebuild nhi hogi serf text j return mai ek widget ki tor pr diya hai wohi he rebuild horhi
    // ignore: avoid_print
    print('build');  //idher sy bhe output mai dekh skty when you click add on ui full widget will be rebuild
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text('Provider Count Exmaple'),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child){
          // ignore: avoid_print
          print('Only this widget builds'); //here see and test the widget yahooo
          return  Text(value.count.toString(), 
            style: const TextStyle(color: Colors.black, fontSize: 50));
        })
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {
            countProvider.setCount();
          }, child: const Icon(Icons.add)),
    );
  }
}

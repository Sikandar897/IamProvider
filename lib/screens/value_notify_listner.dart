/* In this example we are going to use statless widget as a statefull widget it is just a hurrah concept of a provider */
/*Morever we dosenot required to create a seprate class just like we do in other and create its change notifer etc*/
/*we are just need to use the ValueListenable which will work for changenotifer and will work same like as previous count provider example*/

//import 'dart:ffi';

import 'package:flutter/material.dart';

class NotifyListnerScreen extends StatelessWidget {
  const NotifyListnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /* below variable _count have type valuenotifier will work for us like statefll widget */

    ValueNotifier<int> count = ValueNotifier(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statless widget as a statefull'),
      ),
      body: Center(
          child: ValueListenableBuilder(
              valueListenable: count,
              builder: (context, value, child) {
                return Text(
                  count.value.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 40),
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count.value++;
          // ignore: avoid_print
          print(count.value.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

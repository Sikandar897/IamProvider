import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_2/provider/provider.dart';

class ExampleTwoProviderScreen extends StatefulWidget {
  const ExampleTwoProviderScreen({super.key});
  @override
  State<ExampleTwoProviderScreen> createState() => _ExampleTwoProviderScreen();
}

class _ExampleTwoProviderScreen extends State<ExampleTwoProviderScreen> {
  @override
  Widget build(BuildContext context) {
    // you can see in debug consloe pori app rebuild horahi while changing slider but bro we just want to rebuild the slider not the whole ui
    
   /*nechy wala veriable class ka jo hai abh remove this now as nechy consumer abh sara kam ye wala kr ki de rha*/
   // final provider = Provider.of<ExampleProvider>(context, listen: true); 
    
    // ignore: avoid_print
    print('build wala');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Provider Example 2'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<ExampleProvider>(builder: (context, value, child){
            // ignore: avoid_print
          print('consumer widgt 1');
            return  Slider(value: value.value, onChanged: (val) {
            //min: 0;
            //max: 1;
            value.setValue(val);
            
          });
          }),
         Consumer<ExampleProvider>(builder: (context, value, child){
          // ignore: avoid_print
          print('consumer widgt 2');
            return Row(
            children: [
              Expanded(
                child: Container(
                  width: 100, 
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(value.value)
                  ),
                  child: const Center(
                    child: Text('Container 1', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 100, 
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(value.value)
                  ),
                  child: const Center(
                    child: Text('Container 2', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          );
          }),
          
        ],
      ),
    );
  }
}

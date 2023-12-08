import 'package:flutter/material.dart';

class ExampleTwoProviderScreen extends StatefulWidget {
  const ExampleTwoProviderScreen({super.key});
  @override
  State<ExampleTwoProviderScreen> createState() => _ExampleTwoProviderScreen();
}

class _ExampleTwoProviderScreen extends State<ExampleTwoProviderScreen> {
  double sliderValue =
      1.0; //it is complusry for slider to provide a double value because based on this value slider created
  @override
  Widget build(BuildContext context) {
    // you can see in debug consloe pori app rebuild horahi while changing slider but bro we just want to rebuild the slider not the whole ui
    // ignore: avoid_print
    print('build check ka rebuild kege overall ka serf slider');
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
          Slider(value: sliderValue, onChanged: (value) {
            //min: 0;
            //max: 1;
            sliderValue = value;
            setState(() {
            });
          }),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: 100, 
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(sliderValue)
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
                    color: Colors.red.withOpacity(sliderValue)
                  ),
                  child: const Center(
                    child: Text('Container 2', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItems= []; //this is a list array  
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('build');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favourite Screen'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index){
                return ListTile(
                  onTap: (){
                  
                  selectedItems.add(index);
                  setState(() {
                    
                  });
                  },
                  title: Text('Item${index+1}', style: const TextStyle(color: Colors.black)),
                  trailing: Icon(
                    selectedItems.contains(index) ? Icons.favorite : Icons.favorite_outline), //here is logic for making item favirout using ternery opreator
                );
            }),
          )
        ],
      ),
    );
  }
}
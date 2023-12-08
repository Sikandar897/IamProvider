import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_2/provider/favourite_provider.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({super.key});

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
 @override
  Widget build(BuildContext context) {
     final favouritItemProvider = Provider.of<FavouritItemProvider>(context);
    // ignore: avoid_print
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favourite'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyFavouriteScreen()),
              );
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favouritItemProvider.selectedItems.length,
              itemBuilder: (context, index){
                return Consumer<FavouritItemProvider>(builder: (context , value, child){
                  return ListTile(
                  onTap: (){
                  if(value.selectedItems.contains(index)){
                    value.removeItems(index);
                  }
                  else{
                    value.addItems(index);
                  }
                  },
                  title: Text('Item${index+1}', style: const TextStyle(color: Colors.black)),
                  trailing: Icon(
                    value.selectedItems.contains(index) ? Icons.favorite : Icons.favorite_outline), //here is logic for making item favirout using ternery opreator
                );
                });
            }),
          )
        ],
      ),
    );
  }
}
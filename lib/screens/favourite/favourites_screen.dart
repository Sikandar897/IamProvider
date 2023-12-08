import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_2/provider/favourite_provider.dart';
import 'package:provider_example_2/screens/favourite/myfavourite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Screen'),
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
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavouritItemProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItems.contains(index)) {
                          value.removeItems(index);
                        } else {
                          value.addItems(index);
                        }
                      },
                      title: Text('Item${index + 1}',
                          style: const TextStyle(color: Colors.black)),
                      trailing: Icon(value.selectedItems.contains(index)
                          ? Icons.favorite
                          : Icons
                              .favorite_outline), //here is logic for making item favirout using ternery opreator
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}

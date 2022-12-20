import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/dog_breeds_bloc.dart';

class DogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllDogs();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Breeds'),
      ),
      body: StreamBuilder(
        stream: bloc.allDogs,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data?.breeds?.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return Text((snapshot.data?.breeds?[index])!);
        });
  }
}

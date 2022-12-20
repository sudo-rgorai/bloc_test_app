import 'dart:async';
import 'dog_api_provider.dart';
import '../models/item_model.dart';

class Repository {
  final dogsApiProvider = DogApiProvider();

  Future<ItemModel> fetchAllDogs() => dogsApiProvider.fetchDogList();
}
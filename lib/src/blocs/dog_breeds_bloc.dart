import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class DogsBloc {
  final _repository = Repository();
  final _dogsFetcher = PublishSubject<ItemModel>();

  Stream<ItemModel> get allDogs => _dogsFetcher.stream;

  fetchAllDogs() async {
    ItemModel itemModel = await _repository.fetchAllDogs();
    _dogsFetcher.sink.add(itemModel);
  }

  dispose() {
    _dogsFetcher.close();
  }
}

final bloc = DogsBloc();
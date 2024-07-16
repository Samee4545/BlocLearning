import 'package:multibloc/Model/favouriteListModel.dart';

class favouriteRepository {
  Future<List<favouriteItemModel>> fetchItem() async {
    await Future.delayed(const Duration(seconds: 3));

    return List.of(_generateList(10));
  }

  List<favouriteItemModel> _generateList(int length) {
    return List.generate(
        length,
        (index) =>
            favouriteItemModel(id: index.toString(), name: 'item $index'));
  }
}

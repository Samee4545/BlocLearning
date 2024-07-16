import 'package:equatable/equatable.dart';
import 'package:multibloc/Model/favouriteListModel.dart';

abstract class FavouriteEvent extends Equatable {
  FavouriteEvent();

  @override
  List<Object> get props => [];
}

class fetchFaouriteList extends FavouriteEvent {}

class favouriteItem extends FavouriteEvent {
  final favouriteItemModel item;
  favouriteItem({required this.item});
}

class selectItem extends FavouriteEvent {
  final favouriteItemModel item;
  selectItem({required this.item});
}

class unSelectItem extends FavouriteEvent {
  final favouriteItemModel item;
  unSelectItem({required this.item});
}

class DeleteItem extends FavouriteEvent {}

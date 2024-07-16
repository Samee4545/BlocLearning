import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multibloc/Model/favouriteListModel.dart';
import 'package:multibloc/Repository/faourite_repositoroy.dart';
import 'package:multibloc/bloc/favourite_list_bloc/favouriteListEvent.dart';
import 'package:multibloc/bloc/favourite_list_bloc/favouriteListStates.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteStates> {
  List<favouriteItemModel> favouriteList = [];
  List<favouriteItemModel> tempfavouriteList = [];
  favouriteRepository FavouriteRepository;
  FavouriteBloc(this.FavouriteRepository) : super(const FavouriteStates()) {
    on<fetchFaouriteList>(fetchList);
    on<favouriteItem>(_addFavouriteItem);
    on<selectItem>(_SelectItem);
    on<unSelectItem>(_UnSelectItem);
    on<DeleteItem>(_deleteItem);
  }

  void fetchList(fetchFaouriteList event, Emitter<FavouriteStates> emit) async {
    favouriteList = await FavouriteRepository.fetchItem();
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        loadingStatus: LoadingStatus.successful));
  }

  void _addFavouriteItem(
      favouriteItem event, Emitter<FavouriteStates> emit) async {
    final index =
        favouriteList.indexWhere((element) => element.id == event.item.id);
    if (event.item.isFavourite) {
      if (tempfavouriteList.contains(favouriteList[index])) {
        tempfavouriteList.remove(favouriteList[index]);
        tempfavouriteList.add(event.item);
      }
    }
    favouriteList[index] = event.item;
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        tempfavouriteItemList: List.from(tempfavouriteList)));
  }

  void _SelectItem(selectItem event, Emitter<FavouriteStates> emit) async {
    tempfavouriteList.add(event.item);
    emit(state.copyWith(tempfavouriteItemList: List.from(tempfavouriteList)));
  }

  void _UnSelectItem(unSelectItem event, Emitter<FavouriteStates> emit) async {
    tempfavouriteList.remove(event.item);
    emit(state.copyWith(tempfavouriteItemList: List.from(tempfavouriteList)));
  }

  void _deleteItem(DeleteItem event, Emitter<FavouriteStates> emit) async {
    for (int i = 0; i < tempfavouriteList.length; i++) {
      favouriteList.remove(tempfavouriteList[i]);
    }
    tempfavouriteList.clear();
    emit(state.copyWith(
        tempfavouriteItemList: List.from(tempfavouriteList),
        favouriteItemList: List.from(favouriteList)));
  }
}

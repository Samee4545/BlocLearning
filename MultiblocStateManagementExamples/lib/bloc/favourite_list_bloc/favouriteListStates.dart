import 'package:equatable/equatable.dart';
import 'package:multibloc/Model/favouriteListModel.dart';

enum LoadingStatus { loading, successful, failed }

class FavouriteStates extends Equatable {
  final List<favouriteItemModel> favouriteItemList;
  final List<favouriteItemModel> tempfavouriteItemList;
  final LoadingStatus loadingStatus;
  const FavouriteStates({
    this.tempfavouriteItemList = const [],
    this.favouriteItemList = const [],
    this.loadingStatus = LoadingStatus.loading,
  });

  FavouriteStates copyWith(
      {List<favouriteItemModel>? favouriteItemList,
      final List<favouriteItemModel>? tempfavouriteItemList,
      LoadingStatus? loadingStatus}) {
    return FavouriteStates(
        tempfavouriteItemList:
            tempfavouriteItemList ?? this.tempfavouriteItemList,
        favouriteItemList: favouriteItemList ?? this.favouriteItemList,
        loadingStatus: loadingStatus ?? this.loadingStatus);
  }

  @override
  List<Object> get props =>
      [favouriteItemList, loadingStatus, tempfavouriteItemList];
}

import 'package:equatable/equatable.dart';

class favouriteItemModel extends Equatable {
  favouriteItemModel({
    required this.id,
    required this.name,
    this.isDeleted = false,
    this.isFavourite = false,
  });
  final String id;
  final String name;
  final bool isFavourite;
  final bool isDeleted;

  favouriteItemModel copyWith(
      {String? id, String? name, bool? isFavourite, bool? isDeleted}) {
    return favouriteItemModel(
        id: id ?? this.id,
        name: name ?? this.name,
        isFavourite: isFavourite ?? this.isFavourite,
        isDeleted: isDeleted ?? this.isDeleted);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, isFavourite, isDeleted];
}

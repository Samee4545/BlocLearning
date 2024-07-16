import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multibloc/Model/favouriteListModel.dart';
import 'package:multibloc/bloc/favourite_list_bloc/favouriteListBloc.dart';
import 'package:multibloc/bloc/favourite_list_bloc/favouriteListEvent.dart';
import 'package:multibloc/bloc/favourite_list_bloc/favouriteListStates.dart';

class FavouriteListScreen extends StatefulWidget {
  const FavouriteListScreen({super.key});

  @override
  State<FavouriteListScreen> createState() => _FavouriteListScreenState();
}

class _FavouriteListScreenState extends State<FavouriteListScreen> {
  @override
  void initState() {
    context.read<FavouriteBloc>().add(fetchFaouriteList());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite List"),
        centerTitle: true,
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteStates>(
            builder: (context, state) {
              return Visibility(
                visible: state.tempfavouriteItemList.isNotEmpty ? true : false,
                child: IconButton(
                    onPressed: () {
                      context.read<FavouriteBloc>().add(DeleteItem());
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<FavouriteBloc, FavouriteStates>(
            builder: (context, state) {
          if (state.loadingStatus == LoadingStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.loadingStatus == LoadingStatus.failed) {
            return const Center(child: Text("Failed to load"));
          } else {
            return ListView.builder(
                itemCount: state.favouriteItemList.length,
                itemBuilder: ((context, index) {
                  final item = state.favouriteItemList[index];
                  return Card(
                      child: ListTile(
                          title: Text(item.name.toString()),
                          leading: Checkbox(
                              value: state.tempfavouriteItemList.contains(item),
                              onChanged: (value) {
                                if (value == true) {
                                  context
                                      .read<FavouriteBloc>()
                                      .add(selectItem(item: item));
                                } else {
                                  context
                                      .read<FavouriteBloc>()
                                      .add(unSelectItem(item: item));
                                }
                              }),
                          trailing: IconButton(
                            onPressed: () {
                              favouriteItemModel FavouriteItemModel =
                                  favouriteItemModel(
                                      id: item.id,
                                      name: item.name,
                                      isFavourite:
                                          item.isFavourite ? false : true);
                              context
                                  .read<FavouriteBloc>()
                                  .add(favouriteItem(item: FavouriteItemModel));
                            },
                            icon: Icon(item.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border_outlined),
                          )));
                }));
          }
        }),
      ),
    );
  }
}

import 'package:ardwtalab/core/helper/navigation_helper.dart';
import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/core/widget/insdecator.dart';
import 'package:ardwtalab/features/Favorits/Widget/empty_favorite.dart';
import 'package:ardwtalab/features/details/View/details_View.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ardwtalab/features/Favorits/Cubit/get_favorite_cubit.dart';
import 'package:ardwtalab/features/Favorits/Cubit/get_favorite_states.dart';

import '../Widget/BuildFavoriteCart.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    super.initState();
    FavoritesCubit.get(context).getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //     "favorites": "المفضلة",
      //  "no_item_in_favorite": "لا يوجد عناصر في المفضلة",
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate("favorites"),
        ),
        actions: [
          IconButton(
              onPressed: () {
                FavoritesCubit.get(context).getFavorites();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
              if (state is GetFavoritesLoading) {
                return const MyIndecator();
              } else if (state is GetFavoritesSuccess) {
                var favoriteModel = FavoritesCubit.get(context).favoriteModel;
                if (favoriteModel?.data?.isNotEmpty == true) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: favoriteModel!.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        var favoritedata = favoriteModel.data![index];
                        return GestureDetector(
                          onTap: () {
                            navigateTo(
                                context,
                                DetailsView(
                                  productId: "${favoritedata.key}",
                                ));
                          },
                          child: BuildFavoriteCart(
                            image: favoritedata.image ?? "",
                            title: favoritedata.title ?? "",
                            fullname: favoritedata.customer?.firstName ?? "",
                            cityname: favoritedata.city?.name ?? "",
                            createdat: "${favoritedata.createdAt ?? ""}",
                            addtofavoritePressed: () {
                              FavoritesCubit.get(context)
                                  .addToFavorite(favoritedata.key);
                            },
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const FavoriteIsEmpty();
                }
              } else if (state is GetFavoritesError) {
                return const Text(
                  'Error occurred',
                );
              } else {
                return const Text('Initial state');
              }
            },
          ),
        ],
      ),
    );
  }
}

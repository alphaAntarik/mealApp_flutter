import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/meal.dart';
import '../widgets/meal_item.dart';

class Favourites_screen extends StatelessWidget {
  static const Favourites_screen_routeName = '/Favourite_screen';
  final List<Meal> _fav;

  Favourites_screen(this._fav);
  @override
  Widget build(BuildContext context) {
    if (_fav.isEmpty) {
      return Center(
        child: Text("you have no favourites yet - start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _fav[index].id,
            title: _fav[index].title,
            imageUrl: _fav[index].imageUrl,
            duration: _fav[index].duration,
            complexity: _fav[index].complexity,
            affordability: _fav[index].affordability,
          );
        },
        itemCount: _fav.length,
      );
    }
  }
}

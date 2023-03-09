import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../screens/category_meals_screen.dart';

class Category_item extends StatelessWidget {
  final String id;
  final String item;
  final Color color;

  Category_item({@required this.id, @required this.item, @required this.color});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(Category_meals_screen.routeNameCategories_meal,
        arguments: {'id': id, 'title': item});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            item,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }
}

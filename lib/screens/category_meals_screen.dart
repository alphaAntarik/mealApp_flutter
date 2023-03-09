import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meal_app/dummy%20data/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../model/meal.dart';

class Category_meals_screen extends StatefulWidget {
  static String routeNameCategories_meal = '/categories_meals_screen';
  List<Meal> allfilteredmeals;

  Category_meals_screen(this.allfilteredmeals);

  @override
  State<Category_meals_screen> createState() => _Category_meals_screenState();
}

class _Category_meals_screenState extends State<Category_meals_screen> {
  String categoryTitle;
  List<Meal> diaplayedMeal;

  // void _removeMeals(String mealId) {
  //   setState(() {
  //     diaplayedMeal.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  void didChangeDependencies() {
    final routeargs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeargs['title'];
    final categoryId = routeargs['id'];
    diaplayedMeal = widget.allfilteredmeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }
  // final String categoryId;
  // final String categoryTitle;

  // Category_meals_screen({required this.categoryId, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: diaplayedMeal[index].id,
              title: diaplayedMeal[index].title,
              imageUrl: diaplayedMeal[index].imageUrl,
              duration: diaplayedMeal[index].duration,
              complexity: diaplayedMeal[index].complexity,
              affordability: diaplayedMeal[index].affordability,
              // removeItem: _removeMeals,
            );
          },
          itemCount: diaplayedMeal.length,
        ));
  }
}

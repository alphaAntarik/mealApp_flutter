import 'package:flutter/material.dart';
import 'package:meal_app/dummy%20data/dummy_data.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screens/favourites_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'lactose': false,
    'vegeterian': false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favourites = [];

  void _setFilters(Map<String, bool> filtersave) {
    setState(() {
      _filters = filtersave;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] && !element.isVegan) {
          return false;
        }
        if (_filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegeterian'] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isFavourite(String id) {
    return _favourites.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals App",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(_favourites),
        Category_meals_screen.routeNameCategories_meal: (ctx) =>
            Category_meals_screen(_availableMeals),
        Meal_detail_screen.MEal_detail_screen_route: (ctx) =>
            Meal_detail_screen(_toggleFav, _isFavourite),
        Filter_screen.Filter_screen_routename: (ctx) =>
            Filter_screen(_filters, _setFilters),
      },
    );
  }

  void _toggleFav(String mealId) {
    final existingIndex = _favourites.indexWhere((element) =>
        element.id == mealId); //indexwhere returns -1 if condition is false
    if (existingIndex >= 0) {
      //if the meal is already added then remove it
      setState(() {
        _favourites.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favourites
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }
}

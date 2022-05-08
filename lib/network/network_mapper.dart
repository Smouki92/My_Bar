import 'dart:convert';
import 'package:my_bar/models/cocktails.dart';


class CocktailMapper {
  Cocktail mapCocktailModel(Map<String, dynamic> json) {
    final id = json['idDrink'];
    final name = json['strDrink'];
    final image = json['strDrinkThumb'];
    final description = json['strInstructions'];

    return Cocktail(id: id, name: name, image: image, description: description);
  }

  List<Cocktail> mapCocktailList(String body) {

    final json = jsonDecode(body);
    final drinks = json['drinks'] as List;

    return drinks.map((e) => mapCocktailModel(e as Map <String, dynamic>)).toList();
  }
}
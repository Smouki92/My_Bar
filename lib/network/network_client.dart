import 'package:http/http.dart' as http;

class NetworkClient {
  Future<String> getData() async {
    var url = Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/search.php?s=');
    var response = await http.get(url);

    return response.body;
  }

  Future<String> getCocktail(String id) async {
    var url = Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id');
    var response = await http.get(url);

    return response.body;
  }
}
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/services/http_service.dart';

class DataService {
  static final DataService _singleton = DataService._internal();

  final HTTPservice _httpservice = HTTPservice();

  factory DataService() {
    return _singleton;
  }
  DataService._internal();

  Future<List<Recipe>?> getRecipes(String filter) async {
    String path = "/recipes/";
    if(filter.isNotEmpty){
      path += "meal-type/$filter";
    
    }
    var response = await _httpservice.get(path);
    if (response?.statusCode == 200 && response?.data != null) {
      // return response!.data;

      List data = response!.data["recipes"];
      List<Recipe> recipes = data.map((e) => Recipe.fromJson(e)).toList();
      print(response!.data);
      return recipes;
    }
  }
}

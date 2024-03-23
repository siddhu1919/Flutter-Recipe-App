import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/pages/recipe_page.dart';
import 'package:recipe_app/services/data_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _mealTypeFilter = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "RECIPE BOOK",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        toolbarHeight: 80,
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

  Widget _buildUI() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          _recipeTypeButtons(),
          _recipeList(),
        ],
      ),
    );
  }

  Widget _recipeTypeButtons() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.05,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: FilledButton(
              onPressed: () {
                setState(() {
                  _mealTypeFilter = "/snack";
                });
              },
              child: const Text("🍇Snack"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.deepOrangeAccent)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: FilledButton(
              onPressed: () {
                setState(() {
                  _mealTypeFilter = "/breakfast";
                });
              },
              child: const Text("🍳Breakfast"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.deepOrangeAccent)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: FilledButton(
              onPressed: () {
                setState(() {
                  _mealTypeFilter = "/lunch";
                });
              },
              child: const Text("🍛Lunch"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.deepOrangeAccent)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: FilledButton(
              onPressed: () {
                setState(() {
                  _mealTypeFilter = "/dinner";
                });
              },
              child: const Text("🥗Dinner"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.deepOrangeAccent)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _recipeList() {
    return Expanded(
        child: FutureBuilder(
            future: DataService().getRecipes(_mealTypeFilter),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Something went wrong"),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Recipe recipe = snapshot.data![index];
                    return ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RecipePage(
                            recipe: recipe,
                          );
                        }));
                      },
                      contentPadding: const EdgeInsets.only(
                        top: 10,
                      ),
                      isThreeLine: true,
                      subtitle: Text(
                          "${recipe.cuisine}\nDifficulty: ${recipe.difficulty}"),
                      leading: Image.network(recipe.image),
                      title: Text(
                        recipe.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      trailing: Text(
                        "${recipe.rating.toString()} ⭐",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  });
            }));
  }
}

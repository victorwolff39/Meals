import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorite;

  const MealDetailScreen(this.onToggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    Widget _createSectionTitle(String text) {
      return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline6,
          ));
    }

    Widget _createSectionContainer(Widget content) {
      return Container(
        width: 350,
        height: 250,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        child: content,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle('Ingredientes'),
            _createSectionContainer(
              ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(meal.ingredients[index]),
                        ),
                        if ((index + 1) < meal.steps.length) Divider(),
                      ],
                    );
                    /*
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(meal.ingredients[index]),
                      ),
                      color: Theme
                          .of(context)
                          .accentColor,
                    );
                    */
                  }),
            ),
            _createSectionTitle('Passos'),
            _createSectionContainer(ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text((index + 1).toString()),
                        ),
                        title: Text(meal.steps[index]),
                      ),
                      if ((index + 1) < meal.steps.length) Divider(),
                    ],
                  );
                })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(meal) ? Icons.star : Icons.star_border),
        onPressed: () {
          onToggleFavorite(meal);
          //Navigator.of(context).pop(meal.title); //Return meal.title to the previous page when closed
        },
      ),
    );
  }
}

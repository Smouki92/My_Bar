import 'package:flutter/material.dart';

class CocktailsListWidget extends StatefulWidget {
  const CocktailsListWidget({Key? key}) : super(key: key);

  @override
  State<CocktailsListWidget> createState() => _CocktailsListWidgetState();
}

class _CocktailsListWidgetState extends State<CocktailsListWidget> {
  @override
  Widget build(BuildContext context) {
    const image = AssetImage('images/preview.jfif');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cocktails'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 6, 20, 6),
                        height: 50,
                        width: 50,
                        child: const Image(
                          image: image,
                        ),
                      ),
                      const Text('Cocktail name'),
                    ],
                  ),
            ),
          );
        },
      ),
    );
  }
}

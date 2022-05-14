import 'package:flutter/material.dart';
import 'package:my_bar/models/cocktails.dart';
import 'package:my_bar/network/network_client.dart';
import 'package:my_bar/network/network_mapper.dart';

class CocktailsListWidget extends StatefulWidget {
  const CocktailsListWidget({Key? key}) : super(key: key);

  @override
  State<CocktailsListWidget> createState() => _CocktailsListWidgetState();
}

class _CocktailsListWidgetState extends State<CocktailsListWidget> {
  final client = NetworkClient();
  final mapper = CocktailMapper();
  List<Cocktail>? cocktails;

  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    client.getData().then((value) {
      cocktails = mapper.mapCocktailList(value);
      setState(() {});
    });
  }

  void _onPressedCocktail(String? id) {
    Navigator.of(context).pushNamed(
      '/main_screen/cocktail_details',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cocktails'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: cocktails == null ? loading() : content(),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              decoration:  InputDecoration(
                labelText: 'Search',
                filled: true,
                fillColor: Colors.white.withAlpha(235),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget loading() => const CircularProgressIndicator();

  Widget content() => ListView.builder(
        padding: const EdgeInsets.only(top: 75),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: cocktails?.length,
        itemBuilder: (BuildContext context, int index) {
          return element(cocktails?[index]);
        },
      );

  Widget element(Cocktail? cocktail) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: MaterialButton(
            onPressed: () => _onPressedCocktail(cocktail?.id),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 25, 10),
                  height: 60,
                  width: 60,
                  child: Image.network(cocktail?.image ?? ''),
                ),
                Text(
                  cocktail?.name ?? '',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

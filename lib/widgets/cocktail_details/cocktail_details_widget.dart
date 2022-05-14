import 'package:flutter/material.dart';
import 'package:my_bar/models/cocktails.dart';
import 'package:my_bar/network/network_client.dart';
import 'package:my_bar/network/network_mapper.dart';

class CocktailsDetailsWidget extends StatefulWidget {
  final String id;

  const CocktailsDetailsWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<CocktailsDetailsWidget> createState() => _CocktailsDetailsWidgetState();
}

class _CocktailsDetailsWidgetState extends State<CocktailsDetailsWidget> {
  final client = NetworkClient();
  final mapper = CocktailMapper();
  Cocktail? cocktail;

  @override
  void initState() {
    super.initState();
    client.getCocktail(widget.id).then((value) {
      cocktail = mapper.mapCocktailList(value).first;
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cocktail?.name ?? ''),
        centerTitle: true,
      ),
      body: cocktail != null
        ? ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Column(
              children: [
                Image.network(cocktail?.image ?? ''),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                  child: Text(
                    cocktail?.description ?? '',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
      : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

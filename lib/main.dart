import 'package:flutter/material.dart';
import 'package:my_bar/widgets/auth/auth_widget.dart';
import 'package:my_bar/widgets/cocktail_details/cocktail_details_widget.dart';
import 'package:my_bar/widgets/main_screen/main_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(backgroundColor: Color.fromRGBO(3, 37, 65, 1)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromRGBO(3, 37, 65, 1),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      routes: {
        '/auth_screen': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
        '/main_screen/cocktail_details': (context)  {
        final cocktailId = ModalRoute.of(context)?.settings.arguments as String;
         return CocktailsDetailsWidget(id: cocktailId);
          },
      },
      initialRoute: '/auth_screen',
    );
  }
}

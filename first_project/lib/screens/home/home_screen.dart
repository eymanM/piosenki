import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:favorite_button/favorite_button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static final List<String> titles = <String>[
    'Piosenka1',
    'Piosenka2',
    'Piosenka3'
  ];
  static final List<String> songsTexts = <String>['Text1', 'Text2', 'Text3'];
  static final List<String> favoritesSongs = <String>[];

  final List<Widget> _navigationBarChildrens = [
    Container(
      // Home Screen
      child: Center(
        child: ListView.separated(
            itemCount: titles.length,
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemBuilder: (BuildContext context, int index) {
              String word = titles[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/songTextScreen",
                          arguments: songsTexts[index].toString(),
                        );
                      },
                      child: Center(
                          child: Text(
                        word,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        style: GoogleFonts.lato(
                          fontSize: 30,
                        ),
                      ))),
                  FavoriteButton(
                    valueChanged: (_isFavorite) {
                      _isFavorite
                          ? favoritesSongs.add(word)
                          : favoritesSongs.remove(word);
                    },
                  ),
                ],
              );
            }),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/ala.jpg"),
        fit: BoxFit.cover,
      )),
    ),
    Container(
      // Favorites Screen
      child: Center(
        child: ListView.separated(
            itemCount: titles.length,
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemBuilder: (BuildContext context, int index) {
              String word = titles[index];

              if (!favoritesSongs.contains(word)) {
                return Container();
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/songTextScreen",
                          arguments: songsTexts[index].toString(),
                        );
                      },
                      child: Center(
                          child: Text(
                        word,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        style: GoogleFonts.lato(
                          fontSize: 30,
                        ),
                      ))),
                  FavoriteButton(
                    valueChanged: (_isFavorite) {
                      _isFavorite
                          ? favoritesSongs.add(word)
                          : favoritesSongs.remove(word);
                    },
                  ),
                ],
              );
            }),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/ala.jpg"),
        fit: BoxFit.cover,
      )),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Piosenki")),
      ),
      body: _navigationBarChildrens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: new Icon(Icons.home_outlined),
            label: 'Strona główna',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.favorite_outline),
              label: 'Ulubione',
              backgroundColor: Colors.red),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(color: Colors.amberAccent),
        selectedItemColor: Colors.amberAccent,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        onTap: _onItemTapped,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[];
void addStaggeredTiles(){
  var rnd = new Random();
  for (int i=0;i<10;i++){
    _staggeredTiles.add(StaggeredTile.count(rnd.nextInt(4), rnd.nextInt(4)));
  }
}
void addTiles() {
  for (int i = 0; i < 10; i++) {
    _tiles.add(_Tile(Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0), FontAwesomeIcons.building));
  }
}
List<Widget> _tiles = const <Widget>[];
class StoryBoard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    addStaggeredTiles();
    addTiles();
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Story Board'),
        ),
        body: new Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: new StaggeredGridView.count(
              crossAxisCount: 4,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(4.0),
            )));
  }
}

class _Tile extends StatelessWidget {
  const _Tile(this.backgroundColor, this.iconData);

  final Color backgroundColor;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
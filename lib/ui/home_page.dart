import 'package:flutter/material.dart';
import 'package:brave_the_future/ui/ProjectPageUI/project_page.dart';
import 'package:brave_the_future/ui/donationUI/donations.dart';
import 'package:brave_the_future/ui/StoryBoard/StoryBoard.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:brave_the_future/view_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:brave_the_future/ui/ProjectPageUI/GradientAppBar.dart';

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  StaggeredTile.count(2, 4),
  StaggeredTile.count(2, 2),
  StaggeredTile.count(2, 1),
  StaggeredTile.count(2, 1),
];

List<Widget> _tiles = <Widget>[
  _Tile(Colors.blue, FontAwesomeIcons.building, "Building", ProjectPage()),
  _Tile(Colors.green, FontAwesomeIcons.donate, "Donation", DonationPage()),
  _Tile(Colors.pink, FontAwesomeIcons.star, "Story Board", StoryBoard()),
  _Tile(Colors.red, FontAwesomeIcons.signOutAlt, "Sign Out", null)
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage(
                        "assets/refractionsSmall.png"),
                  fit: BoxFit.fill,
                ),


            ),
            child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: new StaggeredGridView.count(
                  crossAxisCount: 4,
                  staggeredTiles: _staggeredTiles,
                  children: _tiles,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  padding: const EdgeInsets.all(4.0),
                ))));
  }
}

class _Tile extends StatelessWidget {
  _Tile(this.backgroundColor, this.iconData, this.itemName, this.navigator);

  final Color backgroundColor;
  final IconData iconData;
  final String itemName;
  final Widget navigator;

  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<ViewModel>(
        builder: (context, child, model) => Card(
              color: backgroundColor,
              child: new InkWell(
                onTap: () {
                  navigator == null
                      ? model.onSignOut()
                      : Navigator.push(context,
                          MaterialPageRoute(builder: (context) => navigator));
                },
                child: new Center(
                  child: new Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            iconData,
                            color: Colors.white,
                          ),
                          new Text(
                            itemName,
                            style: TextStyle(
                                fontFamily: 'Franklin',
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )),
                ),
              ),
            ));
  }
}

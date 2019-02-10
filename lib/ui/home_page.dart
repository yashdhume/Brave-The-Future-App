import 'package:flutter/material.dart';
import 'package:brave_the_future/ui/ProjectPageUI/project_page.dart';
import 'package:brave_the_future/ui/donationUI/donations.dart';
import 'package:brave_the_future/ui/StoryBoard/StoryBoard.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:brave_the_future/view_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:brave_the_future/ui/login_page.dart';
import  'package:brave_the_future/ui/account_page.dart';
import 'package:brave_the_future/ui/root_page.dart';
import 'package:brave_the_future/data/auth.dart';
List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[

  StaggeredTile.count(3, 4),
  StaggeredTile.count(2, 2),
  StaggeredTile.count(1, 4),
  StaggeredTile.count(2, 1),
  StaggeredTile.count(2, 1),
  StaggeredTile.count(4, 1),
];

List<Widget> _tiles = <Widget>[
  _Tile(Color(0xffb0077CA), FontAwesomeIcons.building, "Building", ProjectPage()),
  _Tile(Color(0xffb84BD00), FontAwesomeIcons.donate, "Donation", DonationPage()),
  _Tile(Color(0xffbC71566), FontAwesomeIcons.bookOpen, "Story Board", StoryBoardView()),
  _Tile(Color(0xffbFFCD3A), FontAwesomeIcons.signInAlt, "Sign In",  RootPage(auth: new Auth())),
  _Tile(Color(0xffb804693), FontAwesomeIcons.signOutAlt, "Sign Out", null),
  _Tile(Color(0xffb41B6E6), FontAwesomeIcons.user, "Account Page", AccountPage()),
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Li,
        appBar:  new PreferredSize(
          child: new Container(
            padding: new EdgeInsets.only(
                top: MediaQuery.of(context).padding.top
            ),
            child: new Padding(
              padding: const EdgeInsets.only(
                  left: 30.0,
                  top: 20.0,
                  bottom: 20.0
              ),
              child: new Image.asset("assets/BraveTheFuture_ThreeLines_Tagline.png"),
            ),
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      const Color(0xffb003C71),
                      const Color(0xffb0077CA),
                    ]
                ),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black,
                    blurRadius: 20.0,
                    spreadRadius: 1.0,
                  )
                ]
            ),
          ),
          preferredSize: new Size(
              MediaQuery.of(context).size.width,
              150.0
          ),
        ),
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

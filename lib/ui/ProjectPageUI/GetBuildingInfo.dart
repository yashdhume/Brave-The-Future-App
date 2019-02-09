import 'package:flutter/material.dart';
import 'package:brave_the_future/ui/ProjectPageUI/Building.dart';

class BuildingInfoPage extends StatelessWidget {
  final Building building;

  BuildingInfoPage(this.building);
  @override
  Widget build(BuildContext context) {
    final _buildingThumbnail = new Container(
      alignment: FractionalOffset.center,
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      child: new Hero(
        tag: "building-hero-${building.id}",
        child: new Image(
          image: new AssetImage(building.image),
          height: 92.0,
          width: 92.0,
        ),
      ),

    );

    return new Scaffold(
      body: new Container(
        color: const Color(0xffb0077CA),
        constraints: new BoxConstraints.expand(),
        child: new Stack(
          children: <Widget>[
            _buildingThumbnail
          ],
        ),
      ),
    );
  }
}

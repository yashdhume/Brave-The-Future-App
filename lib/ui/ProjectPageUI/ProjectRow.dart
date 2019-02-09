import 'package:flutter/material.dart';
import 'package:brave_the_future/ui/ProjectPageUI/Building.dart';

class ProjectRow extends StatelessWidget {
  final Building building;

  ProjectRow(this.building);

  Widget build(BuildContext context) {
    final buildingContainer = new Container(
      margin: new EdgeInsets.only(top:60, ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: new Image(
          image: new AssetImage(building.image),
          //width: 200,
        ),
      )
    );
    final projectCard = new Container(
      constraints: new BoxConstraints.expand(),
      height: 124.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color: new Color(0xffb0077CA),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new SizedBox(
            height: 4,
          ),
          new Text(
            building.name,
          ),
        ],
      ),
    );

    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: new Stack(
        children: <Widget>[
          projectCard,
          buildingContainer,
        ],
      ),
    );
  }
}

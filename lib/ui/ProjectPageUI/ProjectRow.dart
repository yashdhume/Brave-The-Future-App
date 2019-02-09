import 'package:flutter/material.dart';
import 'package:brave_the_future/ui/ProjectPageUI/Building.dart';
import 'package:brave_the_future/ui/ProjectPageUI/GetBuildingInfo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectRow extends StatelessWidget {
  final Building building;
  final bool horizontal;

  ProjectRow(this.building, {this.horizontal = true});

  ProjectRow.vertical(this.building) : horizontal = false;

  Widget build(BuildContext context) {
    final buildingContainer = new Hero(
        tag: "building-hero-${building.id}",
        child: new Container(
            margin: new EdgeInsets.only(
              top: 60,
            ),
            alignment: horizontal
                ? FractionalOffset.centerLeft
                : FractionalOffset.center,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: new Image(
                image: new AssetImage(building.image),
                //width: 200,
              ),
            )));
    final projectCard = new Container(
      constraints: new BoxConstraints.expand(),
      height: 120.0,
      margin: new EdgeInsets.only(left: 46.0),
      padding: new EdgeInsets.all(5),
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
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Franklin',
                fontWeight: FontWeight.w600,
                fontSize: 15.0),
          ),
          new Container(
              //alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new SizedBox(width: 10.0),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        new Icon(
                          FontAwesomeIcons.map,
                          size: 12,
                        ),
                        new Text(
                          building.location,
                          style: TextStyle(
                              fontFamily: 'Franklin',
                              color: const Color(0xffb6b2df),
                              fontSize: 9.0,
                              fontWeight: FontWeight.w400),
                        ),
                        new SizedBox(width: 10.0),
                        new Icon(
                          FontAwesomeIcons.calendar,
                          size: 12,
                        ),
                        new Text(
                          building.open,
                          style: TextStyle(
                              fontFamily: 'Franklin',
                              color: const Color(0xffb6b2df),
                              fontSize: 9.0,
                              fontWeight: FontWeight.w400),
                        ),
                    new SizedBox(width: 10.0),
                    new Icon(
                      FontAwesomeIcons.building,
                      size: 12,
                    ),
                    new Text(
                      building.squareMeter,
                      style: TextStyle(
                          fontFamily: 'Franklin',
                          color: const Color(0xffb6b2df),
                          fontSize: 9.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ])
                ],
              )),
        ],
      ),
    );

    return new GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BuildingInfoPage(building))),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: new Stack(
            children: <Widget>[
              projectCard,
              buildingContainer,
            ],
          ),
        ));
  }
}

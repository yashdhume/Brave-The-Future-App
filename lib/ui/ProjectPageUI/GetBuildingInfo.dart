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
    Container _background () {
      return new Container(
        child: new Image.asset(building.imageBig,
          fit: BoxFit.cover,
          height: 300.0,
        ),
        constraints: new BoxConstraints.expand(height: 300.0),
      );
    }
    Container _gradient(){
      return new Container(
        margin: new EdgeInsets.only(top:190),
        height: 110,
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: <Color>[
                const Color(0xffb003C71),
                const Color(0xffb0077CA),
              ] ,
              stops: [0.0,0.9],
              begin:  const FractionalOffset(0, 0),
              end: const FractionalOffset(0, 1)
          ),
        ),
      );
    }

    return new Scaffold(
      body: new Container(
        color: const Color(0xffb0077CA),
        constraints: new BoxConstraints.expand(),
        child: SliverList(delegate: SliverChildListDelegate([
            _background(),
            _gradient(),
            _buildingThumbnail
          ],
        ),
      ),
    ));
  }
}

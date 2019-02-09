import 'package:flutter/material.dart';
import 'package:brave_the_future/ui/ProjectPageUI/Building.dart';
class BuildingInfo extends StatelessWidget{
  final Building building;
  BuildingInfo(this.building);
  Widget build(BuildContext context){
    Container _background () {
      return new Container(
        child: new Image.network(building.imageBig,
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
        constraints: new BoxConstraints.expand(),
        color: Color(0xffb0077CA),
        child: Stack(
          children: <Widget>[
            _background(),
            _gradient(),
          ],
        ),

      ),
    );
  }
}
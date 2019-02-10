import 'package:flutter/material.dart';
import 'package:brave_the_future/ui/ProjectPageUI/Building.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildingInfoPage extends StatelessWidget {
  final Building building;
  BuildingInfoPage(this.building);
  Widget _buildingThumbnail(){
    return new Container(
      alignment: FractionalOffset.center,
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      child: new Hero(
        tag: "building-hero-${building.id}",
        child: new Image(
          image: new AssetImage(building.image),
          height: 92.0,
          width: 92.0,
        ),
     ));
  }
    Container _background () {
        return new Container(
          child: Hero(
            tag: "building-hero-${building.id}",
          child: new Image.asset(building.imageBig,
            fit: BoxFit.cover,
            height: 300.0,
          ),
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
  Widget workingVersion(){
    return Stack( children: <Widget>[
            _background(),
            _gradient(),
            _buildingThumbnail()
        ]
      );
  }
  List<Widget> InfoSection(){
    return []
    ..add(PlainCard(icon: IconTheme(data:IconThemeData(color:Colors.blue),child:Icon(FontAwesomeIcons.building)), text: building.squareMeter + 'Square Meters', trail: null))
    ..add(PlainCard(icon: Icon(FontAwesomeIcons.calendar), text: building.open + '', trail: null))
    ..add(PlainCard(icon: Icon(FontAwesomeIcons.map), text: building.location + '', trail: null))
    ..add(PlainCard(icon: Icon(FontAwesomeIcons.pen), text: building.description + 'Square Meters', trail: null));
  }
  @override
  Widget build(BuildContext context) {  
    return new Container(
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
      child:Scaffold(
      backgroundColor: Colors.transparent,
      body: new Container(
        color: const Color(0xffb0077CA),
        constraints: new BoxConstraints.expand(),
        child:CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(                  
                    building.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(125, 0, 0, 255),
                      ),
                    ]
                    ),
                  ),
                centerTitle: true,
                background: _background(),
              ),              
            ),
            SliverList(delegate: SliverChildListDelegate(InfoSection()),)
          ],      
        )
      ),
    ));
  }
}
class PlainCard extends StatelessWidget{
  final Widget icon, trail;
  final String text;
  PlainCard({this.icon, this.text, this.trail});
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 75,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow:  <BoxShadow>[
          BoxShadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 3.0,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          BoxShadow(
            offset: Offset(2.0, 2.0),
            blurRadius: 8.0,
            color: Color.fromARGB(125, 0, 0, 255),
          ),
        ]
      ),
      child: ListTile(
        leading: this.icon,
        title: Text(this.text, style: TextStyle(color: Colors.black),),
        //trailing: Text('smth'),
      )
    );
  }
}

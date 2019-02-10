import 'package:flutter/material.dart';
import 'package:brave_the_future/ui/ProjectPageUI/ProjectRow.dart';
import 'package:brave_the_future/ui/ProjectPageUI/Building.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:brave_the_future/view_model.dart';

class ListOfProjectsBody extends StatelessWidget {

  List<Widget> LoadedProjects(ViewModel model){
    if (model.buildings == null) {
      model.onGetBuildings();
      return [Center(child: CircularProgressIndicator(),)];
    }
    List<Widget> a = [];
    model.buildings.forEach((item){
      a.add(ProjectRow(item));
    });
    return a;
  }
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<ViewModel>( 
      rebuildOnChange: true,
      builder: (context, child, model) => Expanded(
      child: new Container(
        color: new Color(0xffb333F48),
        child: RefreshIndicator( 
          onRefresh: () => model.onRefreshBuildings(),
          child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: new SliverFixedExtentList(
                itemExtent: 152.0,
                delegate: new SliverChildListDelegate(
                  LoadedProjects(model),
                ),
              ),
            ),
          ],
        ),
      )),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:brave_the_future/ui/ProjectPageUI/ProjectRow.dart';
import 'package:brave_the_future/ui/ProjectPageUI/Building.dart';

class ListOfProjectsBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        color: new Color(0xffb333F48),
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: new SliverFixedExtentList(
                itemExtent: 152.0,
                delegate: new SliverChildBuilderDelegate(
                  (context, index) => new ProjectRow(building[index]),
                  childCount: building.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

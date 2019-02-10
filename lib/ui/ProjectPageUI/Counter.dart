import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:brave_the_future/view_model.dart';
import 'package:brave_the_future/data/building.dart';
class CounterCountaier extends StatefulWidget{
  final int count;
  final Building build;
  CounterCountaier({this.count, this.build});
  _CounterCountaier createState()  => _CounterCountaier();
}
class _CounterCountaier extends State<CounterCountaier> {
  int count;
  @override
  void initState() {
    super.initState();
    count = widget.count;
  }
  void _incrementCounter(bool a, ViewModel model) {
    model.onUpdateBuildingCoins(widget.build, 1);
    setState(() {
      if(a) count++;
      else count--;
    });
  }

  Widget build(BuildContext context){
    return new ScopedModelDescendant<ViewModel>(
      builder: (context, child, model) => Container(
        padding: EdgeInsets.all(15.0),
        // width: 150.0,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new FloatingActionButton(
              onPressed: ()=> _incrementCounter(false, model),
              backgroundColor: Color(0xffb003C71),
              child: Text('-'),
            ),
            new Text(
              count.toString(),
              style: new TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            // SizedBox(width: 200),
            new FloatingActionButton(
              onPressed: () => _incrementCounter(true, model),
              backgroundColor: Color(0xffb003C71),
              child: Icon(Icons.add),
            ),

          ],
        ))
    );

  }
}
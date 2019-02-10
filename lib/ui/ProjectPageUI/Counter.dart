import 'package:flutter/material.dart';
class CounterCountaier extends StatefulWidget{
  final int count;
  CounterCountaier({this.count});
  _CounterCountaier createState()  => _CounterCountaier();
}
class _CounterCountaier extends State<CounterCountaier> {
  int count;
  @override
  void initState() {
    super.initState();
    count = widget.count;
  }
  void _incrementCounter(bool a) {
    setState(() {
      if(a) count++;
      else count--;
    });
  }

  Widget build(BuildContext context){
    return new Container(
        padding: EdgeInsets.all(15.0),
        // width: 150.0,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new FloatingActionButton(
              onPressed: ()=> _incrementCounter(false),
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
              onPressed: () => _incrementCounter(true),
              backgroundColor: Color(0xffb003C71),
              child: Icon(Icons.add),
            ),

          ],
        )
    );

  }
}
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:brave_the_future/view_model.dart';
import 'package:font_awesome_flutter/icon_data.dart';

class AccountPage extends StatelessWidget {
  List<Widget> accountHandler(ViewModel model) {
    if (model.user == null) return [loadingState(model)];
    return loadedState(model);
  }

  List<Widget> loadedState(ViewModel model) {
    List<Widget> a = [];
    a
      ..add(ListTile(
        title: Text('Donated: ' + model.user.totalDonated.toString()),
        leading: Icon(Icons.attach_money),
      ))
      ..add(ListTile(
        title: Text('Brave Coins: ' + model.user.braveCoins.toString()),
        leading: Icon(Icons.account_balance_wallet),
      ));
    return a;
  }

  Widget loadingState(ViewModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[CircularProgressIndicator()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
        rebuildOnChange: true,
        builder: (context, child, model) => Scaffold(
                body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Color(0xffb0077CA),
                  expandedHeight: 100,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Account Page'),
                    centerTitle: true,
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(accountHandler(model)),
                )
              ],
            )));
  }
}

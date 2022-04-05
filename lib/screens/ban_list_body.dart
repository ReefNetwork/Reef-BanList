import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reef_bans/model/Ban.dart';

class BanListBody extends StatelessWidget {
  final List<Ban> _bans;

  BanListBody(this._bans);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _bans.length,
      itemBuilder: (BuildContext context, int index) {
        return _banItem(_bans[index]);
      },
    );
  }

  Widget _banItem(Ban ban) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
      child: ListTile(
        title: Text(
          ban.name,
        ),
        onTap: () {},
        onLongPress: () {},
      ),
    );
  }
}

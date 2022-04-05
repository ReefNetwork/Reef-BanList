import 'package:flutter/material.dart';
import 'package:reef_bans/model/Ban.dart';
import 'package:reef_bans/screens/ban_detail.dart';

class BanListBody extends StatelessWidget {
  final List<Ban> _bans;

  BanListBody(this._bans);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _bans.length,
      itemBuilder: (BuildContext context, int index) {
        return _banView(_bans[index], context);
      },
    );
  }

  Widget _banView(Ban ban, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
      child: ListTile(
        title: Center(
          child: Text(
            ban.name,
          ),
        ),
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              builder: (context) => BanDetail(ban));
        },
        onLongPress: () {},
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:reef_bans/model/Ban.dart';

class BanDetail extends StatelessWidget {
  final Ban _ban;

  BanDetail(this._ban);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.8,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: size.width,
            child: Text(
              _ban.name,
              style: theme.textTheme.headline3,
            ),
          ),
          Card(
            child: Container(
              width: size.width * 0.9,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    child: Text(
                      "詳細",
                      style: theme.textTheme.headline4,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                      width: size.width,
                      child: Text(
                        _ban.reason,
                        style: theme.textTheme.headline5,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

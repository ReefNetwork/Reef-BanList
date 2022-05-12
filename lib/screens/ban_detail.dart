import 'package:flutter/material.dart';
import 'package:reef_bans/model/Ban.dart';

class BanDetail extends StatelessWidget {
  final Ban _ban;

  BanDetail(this._ban);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    final create = DateTime.parse(_ban.createTime).toLocal();
    final expire = DateTime.parse(_ban.expireTime).toLocal();

    return Container(
      height: size.height * 0.8,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            width: size.width,
            child: SelectableText(
              _ban.name,
              style: theme.textTheme.headline3,
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              width: size.width * 0.9,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    "詳細",
                    style: theme.textTheme.headline4,
                    textAlign: TextAlign.left,
                  ),
                  _detailView(theme, "理由", _ban.reason),
                  _detailView(theme, "BAN された日",
                      "${create.year}年${create.month}月${create.day}日 ${create.hour}時${create.minute}分"),
                  _detailView(theme, "BAN 期限",
                      "${expire.year}年${expire.month}月${expire.day}日 ${expire.hour}時${expire.minute}分"),
                  _detailView(theme, "IP BAN", _ban.ipBan == 1 ? "はい" : "いいえ"),
                  _detailView(
                      theme, "端末 BAN", _ban.deviceBan == 1 ? "はい" : "いいえ"),
                  _detailView(theme, "BAN した人",
                      _ban.byXuid == "0" ? "権限者(コンソール)" : _ban.byName),
                  _detailView(theme, "BAN ID", _ban.id.toString())
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.all(15),
              width: size.width,
              child: SelectableText("※ここに注意事項書くつもりだったけどいらなくなった")),
        ],
      ),
    );
  }

  Widget _detailView(ThemeData theme, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.headline5,
        ),
        Flexible(
          child: SelectableText(
            value,
            style: theme.textTheme.headline5,
          ),
        ),
      ],
    );
  }
}

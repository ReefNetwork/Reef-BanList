import 'package:flutter/material.dart';
import 'package:reef_bans/model/Ban.dart';
import 'package:url_launcher/url_launcher.dart';

class BanDetail extends StatelessWidget {
  final Ban _ban;
  final ScrollController _sheetController;

  BanDetail(this._ban, this._sheetController);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    final create = DateTime.parse(_ban.createTime);
    final expire = DateTime.parse(_ban.expireTime);

    List<Widget> cards = [
      Container(
        margin: EdgeInsets.all(15),
        width: size.width,
        child: SelectableText(
          _ban.name,
          style: theme.textTheme.displaySmall,
        ),
      ),
      Card(
        margin: EdgeInsets.all(15),
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                "詳細",
                style: theme.textTheme.headlineMedium,
                textAlign: TextAlign.left,
              ),
              _detailView(theme, "理由", _ban.reason),
              _detailView(theme, "BAN された日",
                  "${create.year}年${create.month}月${create.day}日 ${create.hour}時${create.minute}分"),
              _detailView(theme, "BAN 期限",
                  "${expire.year}年${expire.month}月${expire.day}日 ${expire.hour}時${expire.minute}分"),
              _detailView(theme, "IP BAN", _ban.ipBan == 1 ? "はい" : "いいえ"),
              _detailView(theme, "端末 BAN", _ban.deviceBan == 1 ? "はい" : "いいえ"),
              _detailView(theme, "BAN した人",
                  _ban.byXuid == "0" ? "ReefServer" : _ban.byName),
              _detailView(theme, "BAN ID", _ban.id.toString())
            ],
          ),
        ),
      ),
    ];

    if (_ban.byXuid == "0" && _ban.reason.contains("by AntiCheat")) {
      cards.add(Card(
        margin: EdgeInsets.all(15),
        elevation: 10,
        child: Container(
          width: size.width * 15,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.warning_amber),
                  Flexible(
                    child: Text(
                      "ReefAntiCheatが自動で検知し、BANされました",
                      style: theme.textTheme.headlineSmall,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "詳しくは",
                    style: theme.textTheme.headlineSmall,
                    textAlign: TextAlign.left,
                  ),
                  TextButton(
                    onPressed: _launchAntiCheatDoc,
                    child: Text(
                      "こちら",
                      style: theme.textTheme.headlineSmall
                          ?.copyWith(color: Colors.blueAccent),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text(
                    "をご覧ください",
                    style: theme.textTheme.headlineSmall,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
        ),
      ));
    }

    return Container(
      height: size.height * 0.8,
      child: ListView(
        controller: _sheetController,
        children: cards,
      ),
    );
  }

  void _launchAntiCheatDoc() async {
    if (!await launchUrl(Uri.parse(
        "https://reef.ree-jp.net/post/about-reef-server-anti-cheat/")))
      throw "Could not launch anti cheat doc";
  }

  Widget _detailView(ThemeData theme, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.headlineSmall,
        ),
        Flexible(
          child: SelectableText(
            value,
            style: theme.textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}

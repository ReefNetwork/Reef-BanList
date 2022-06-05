import 'package:flutter/material.dart';
import 'package:reef_bans/model/Ban.dart';
import 'package:reef_bans/screens/ban_detail.dart';
import 'package:url_launcher/url_launcher.dart';

class BanListBody extends StatelessWidget {
  final List<Ban> _bans;

  BanListBody(this._bans);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: _bans.length,
          itemBuilder: (BuildContext context, int index) {
            return _banView(_bans[index], context);
          },
        ),
        Center(
          child: TextButton(
            onPressed: _launchDescription,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("(c) ReefNetwork",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ),
        ),
      ],
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
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            builder: (context) => DraggableScrollableSheet(
                expand: false,
                builder: (context, scrollController) => SingleChildScrollView(
                    controller: scrollController, child: BanDetail(ban))),
          );
        },
        onLongPress: () {},
      ),
    );
  }

  void _launchDescription() async {
    if (!await launchUrl(Uri.parse("https://reef.ree-jp.net/page/")))
      throw "Could not launch reef page";
  }
}

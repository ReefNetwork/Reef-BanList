import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reef_bans/model/Ban.dart';
import 'package:reef_bans/screens/ban_list_body.dart';

class BanList extends StatefulWidget {
  BanList({Key? key}) : super(key: key);

  final String title = "ReefBanList";

  @override
  _BanListState createState() => _BanListState();
}

class _BanListState extends State<BanList> {
  List<Ban> _bans = [];
  bool _isProcession = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ReefServer BanList",
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.sync_outlined),
            tooltip: "Reload",
            onPressed: () {
              setState(() {
                _bans = [];
                _getBans();
              });
            },
          ),
        ],
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Filter",
        child: Icon(Icons.filter_list),
      ),
    );
  }

  Widget _body() {
    if (_bans.isEmpty) {
      _getBans();
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(
              height: 10,
            ),
            Text("読み込み中です...")
          ],
        ),
      );
    }

    return BanListBody(_bans);
  }

  Future _getBans() async {
    ThemeData theme = Theme.of(context);

    if (_isProcession) return;
    _isProcession = true;

    try {
      final response = await http.get(_getApiUrl());
      if (response.statusCode != 200) {
        throw Exception("${response.body}(${response.statusCode})");
      }

      _bans = [];
      final List<dynamic> list = jsonDecode(response.body);
      list.forEach((element) {
        _bans.add(Ban.fromMap(element));
      });
      setState(() {});
    } catch (ex) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(days: 1),
          backgroundColor: theme.scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ),
          content: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "データを取得できませんでした(${ex.toString()})",
                  style: theme.textTheme.bodyText1,
                ),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    _getBans();
                  },
                  child: Text(
                    "再試行",
                    style: theme.textTheme.button,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    _isProcession = false;
  }

  Uri _getApiUrl() {
    var isDebug = false;
    assert(isDebug = true);
    if (isDebug) {
      return Uri.parse(
          "http://localhost:5001/reef-mc/asia-northeast1/api/v1/ban/");
    } else {
      return Uri.parse(
          "https://asia-northeast1-reef-mc.cloudfunctions.net/api/v1/ban/");
    }
  }
}

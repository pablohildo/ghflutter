import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'strings.dart';
import 'member.dart';

class GHFlutterState extends State<GHFlutterWidget> {
  var _members = <Member>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(Strings.appTitle),
      ),
      body: new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _members.length,
        itemBuilder: (BuildContext context, int position) {
         return _buildRow(position);
        })
    );
  }

  Widget _buildRow(int i) {
    return new ListTile(
      title: new Text("${_members[i].login}", style: _biggerFont),
      leading: new CircleAvatar(
        backgroundColor: Colors.green,
        backgroundImage: new NetworkImage(_members[i].avatarUrl),
      ),
    );
  }

  _loadData() async {
    String dataUrl = "https://api.github.com/orgs/raywenderlich/members";
    http.Response response = await http.get(dataUrl);
    setState(() {
      final membersJson = json.decode(response.body);

      for (var memberJSON in membersJson) {
        final member = new Member(memberJSON['login'], memberJSON['avatar_url']);
        _members.add(member);
      }
    });
  }
}

class GHFlutterWidget extends StatefulWidget {
  @override
  createState() => new GHFlutterState();
}
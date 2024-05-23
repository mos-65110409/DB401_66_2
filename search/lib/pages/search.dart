import 'package:flutter/material.dart';

import '../models/country.dart';

class Search extends StatefulWidget {
  final Continent continent;

  const Search({required this.continent, super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late Country country;
  late List<ListTile> suggestion;

  @override
  void initState() {
    country = Country(widget.continent);
    suggestion = country.suggest('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      // ข้อ 4.
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(hintText: 'seach'),
              keyboardType: TextInputType.text,
            ), // ข้อ 5. และ ข้อ 6.
          ),
          Expanded(
              // ignore: body_might_complete_normally_nullable
              child: ListView.builder(
            itemBuilder: (BuildContext context, int country) {
              return ListTile(
                title: Text('${suggestion[country].selected}'),
              );
            },
          )) // ข้อ 7.
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_11/model/character.dart';

import 'package:http/http.dart' as http;

class HomePageViewModel with ChangeNotifier {
  final String _apiUrl = "https://rickandmortyapi.com/api/character";

  List<Character> _characters = [];

  List<Character> get characters => _characters;

  HomePageViewModel() {
    _getAllCharacters();
  }

  void _getAllCharacters() async {
    Uri uri = Uri.parse(_apiUrl);

    http.Response response = await http.get(uri);

    List<dynamic> allCharacters = (jsonDecode(response.body)["results"]);

    for (Map<String, dynamic> characterMap in allCharacters) {
      Character character = Character.fromMap(characterMap);
      _characters.add(character);
    }
    notifyListeners();
  }
}

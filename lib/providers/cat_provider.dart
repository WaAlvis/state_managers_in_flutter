import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:state_manager_in_flutter/models/cat_image_response.dart';

class CatProvider extends ChangeNotifier {
  final String _api_key =
      'live_pnNaLnzhutgEe7LZvEnGQFk0lWXzpHsW8yZlplLsQHmPfInv0rVbGpOTAqz7pte8';
  final String _base_url = 'api.thecatapi.com';

  List<CatImageResponse> catList = [];

  CatProvider() {
    print('Cat Provider inicializado');
    getOnDisplayCats();
  }

  getOnDisplayCats() async {
    var url = Uri.https(_base_url, 'v1/images/search', {
      'api_key': _api_key,
      'limit': '10',
    });
    // var response = await http.get(url);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');

    final List<dynamic> decodeData = jsonDecode(response.body);

    catList = decodeData.map((json) => CatImageResponse.fromMap(json)).toList();
    notifyListeners();
  }
}

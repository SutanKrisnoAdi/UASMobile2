import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:inventory/models/item.dart';

class ApiService {
  final String apiUrl = "API"; // URL API

  Future<List<Item>> getItems() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => Item.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<Item> createItem(Item item) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(item.toJson()),
    );
    if (response.statusCode == 201) {
      return Item.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create item');
    }
  }

  Future<void> updateItem(Item item) async {
    final response = await http.put(
      Uri.parse("$apiUrl/${item.id}"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(item.toJson()),
    );
    if (response.statusCode != 204) {
      print('Item updated successfully');}
      else{
      throw Exception('Failed to update item');
    }
  }

  Future<void> deleteItem(int id) async {
    final response = await http.delete(
      Uri.parse("$apiUrl/$id"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode != 204) {
      throw Exception('Failed to delete item');
    }
  }
}

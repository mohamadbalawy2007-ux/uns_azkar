import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavItem {
  final String Path;
  final String Name;

  FavItem(this.Path, this.Name);
}

class FavoritesData {
  static final ValueNotifier<List<FavItem>> Items = ValueNotifier<List<FavItem>>([]);
  static const String _key = "favorite_athkar";

  static Future<void> Load() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(_key) ?? [];
    Items.value = saved.map((e) {
      final index = e.indexOf("|");
      return FavItem(e.substring(0, index), e.substring(index + 1));
    }).toList();
  }

  static Future<void> _Save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _key,
      Items.value.map((e) => "${e.Path}|${e.Name}").toList(),
    );
  }

  static bool IsFavorite(String path) {
    return Items.value.any((e) => e.Path == path);
  }

  static void Toggle(String path, String name) {
    final list = List<FavItem>.of(Items.value);
    if (IsFavorite(path)) {
      list.removeWhere((e) => e.Path == path);
    } else {
      list.add(FavItem(path, name));
    }
    Items.value = list;
    _Save();
  }
}
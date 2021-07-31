import 'package:flutter_im/models/chat.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

// 历史登录帐号
Future<List<String>> getHistoryAccount() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final data = prefs.getStringList('historAccount') ?? [];
  return data;
}

void setHistoryAccout(List<String> accountList) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList('historAccount', accountList);
}

class MySqlite {
  static Database? _db;
  static init() async {
    _db = await openDatabase('my_db.db',
        version: 3,
        onCreate: (Database db, int version) => {
              db.execute(
                  'CREATE TABLE chats(id INTEGER PRIMARY KEY, conversationId TEXT, owner TEXT, type TEXT, lastMsgId TEXT, topState TEXT)')
            },
        onUpgrade: (Database db, int oldVersion, int newVersion) => {
              db.execute(
                  'CREATE TABLE chats(id INTEGER PRIMARY KEY, conversationId TEXT, owner TEXT, type TEXT, lastMsgId TEXT, topState TEXT)')
            },
        onOpen: (Database db) => {print('db on open')});
  }

  static Future<Database> getInstance() async {
    if (_db == null) {
      await init();
      return _db!;
    } else {
      return _db!;
    }
  }
}

Future<List<ChatModel>> getChatList() async {
  final db = await MySqlite.getInstance();
  final result = await db.query('chats');
  return result.map((e) => ChatModel.fromJson(e)).toList();
}

addChat(dynamic data) async {
  final db = await MySqlite.getInstance();
  final result = await db.insert('chats', data);
  return result;
}

removeChat(String id) async {
  final db = await MySqlite.getInstance();
  final result = await db.delete('chat', where: id);
  return result;
}

updateChat(dynamic data) async {
  final db = await MySqlite.getInstance();
  final result = await db.update('chat', data);
  return result;
}

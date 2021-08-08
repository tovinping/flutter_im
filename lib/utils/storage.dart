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
    _db = await openDatabase(
      'my_db.db',
      version: 4,
      onCreate: (Database? db, int version) => {
        print('db onCreate $version'),
        db?.execute(
            'CREATE TABLE chats(id INTEGER PRIMARY KEY, conversationId TEXT, owner TEXT, type TEXT, lastMsgId TEXT, topState TEXT)')
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) => {
        // db.execute(
        //     'CREATE TABLE chats(id INTEGER PRIMARY KEY, conversationId TEXT, owner TEXT, type TEXT, lastMsgId TEXT, topState TEXT)'),
        print('db onUpgrade $db, $oldVersion, $newVersion')
      },
      onOpen: (Database db) => {print('db on open')},
    ).catchError((error) {
      print('open db is error: $error');
    });
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

addChat(ChatModel data) async {
  final db = await MySqlite.getInstance();
  final result = await db.insert('chats', data.toJson());
  return result;
}

removeChat(String conversationId) async {
  final db = await MySqlite.getInstance();
  final result = await db
      .delete('chats', where: 'conversationId=?', whereArgs: [conversationId]);
  return result;
}

updateChat(dynamic data) async {
  final db = await MySqlite.getInstance();
  final result = await db.update('chat', data);
  return result;
}

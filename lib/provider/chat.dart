import 'package:flutter/material.dart';
import 'package:flutter_im/models/chat.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> _chatList = [];
  ChatModel? _currentChat;

  List<ChatModel> get chatList => _chatList;
  ChatModel? get currentChat => _currentChat;

  void addChat(ChatModel chatItem) {
    _chatList.add(chatItem);
    notifyListeners();
  }

  void batchAddChat(List<ChatModel> chatList) {
    print('batchAddChat');
    _chatList.addAll(chatList);
    notifyListeners();
  }

  void removeChat(String chatId) {
    _chatList.removeWhere((element) => element.conversationId == chatId);
    notifyListeners();
  }

  void setCurrentChat(ChatModel chatItem) {
    this._currentChat = chatItem;
    notifyListeners();
  }
}

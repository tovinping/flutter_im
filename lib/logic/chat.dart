import 'package:flutter/material.dart';
import 'package:flutter_im/models/chat.dart';
import 'package:flutter_im/provider/chat.dart';
import 'package:flutter_im/utils/storage.dart' as storage;
import 'package:provider/provider.dart';

addChat(
  BuildContext context, {
  required String conversationId,
  required String type,
}) {
  final chatItem = ChatModel(
      conversationId: conversationId,
      owner: 'owner',
      type: type,
      lastMsgId: '',
      topState: '0');
  context.read<ChatProvider>().addChat(chatItem);
}

removeChat(BuildContext context, String conversationId) {
  context.read<ChatProvider>().removeChat(conversationId);
  storage.removeChat(conversationId);
}

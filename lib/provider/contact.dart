import 'package:flutter/material.dart';
import 'package:flutter_im/models/contact.dart';

class ContactProvider with ChangeNotifier {
  List<String> contactList = [];
  Map<String, ContactModel> _contactMap = new Map<String, ContactModel>();

  List<String> get chatList => contactList;
  Map<String, ContactModel>? get contactMap => _contactMap;

  void addChat(String contactId) {
    contactList.add(contactId);
    notifyListeners();
  }

  void setContactMap(ContactModel contactItem) {
    this._contactMap[contactItem.account] = contactItem;
    notifyListeners();
  }

  void batchSetContactMap(List<ContactModel> contatList) {
    contatList.forEach((element) {
      _contactMap[element.account] = element;
    });
  }
}

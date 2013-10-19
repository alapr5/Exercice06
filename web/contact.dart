library contact;

import 'dart:html';
import 'dart:json';

part '../model/person.dart';

List contact_id;
InputElement id, firstname, name, email, phone;
LabelElement lbl_error;
ButtonElement btn_create;
Person per;

void main() {
  readLocalStorage();
  bind_elements();
  attach_event_handlers();
}

bind_elements() {
  id = query('#id');
  firstname = query('#firstname');
  name = query('#name');
  email = query('#email');
  phone = query('#phone');
  btn_create = query('#btn_create');
  lbl_error = query('#error');
}

attach_event_handlers() {
  id.onInput.listen(readData);
  firstname.onBlur.listen(notEmpty);
  name.onBlur.listen(notEmpty);
  btn_create.onClick.listen(storeData);
}

notEmpty(Event e) {
  InputElement inel = e.currentTarget as InputElement;
  var input = inel.value;
  if (input == null || input.isEmpty) {
    // window.alert("You must fill in the field ${inel.id}!");
    lbl_error.text = "You must fill in the field ${inel.id}!";
    inel.focus();
  }
}

readLocalStorage(){
  contact_id =[];
  for (var key in window.localStorage.keys){
    contact_id.add(key.substring(1));
  }
}

readData(Event e) {
  // show data:
  var key = 'ID:${id.value}';
  if (!window.localStorage.containsKey(key)) {
    lbl_error.innerHtml = "Contact inconnu";
    id.focus();
    return;
  }
  lbl_error.innerHtml = "";
  // read data from local storage:
  String acc_json = window.localStorage[key];
  per = new Person.fromJson(parse(acc_json));
}


storeData(Event e) {
    // creating the objects:
    Person p = new Person(int.parse(id.value), firstname.value, name.value, email.value, phone.value);
    // store data in local storage:
    try {
      window.localStorage["Person:${p.id}"] = p.toJson();
      window.alert("Contact stored in local storage");
    } on Exception catch (ex) {
      window.alert("Data not stored: Local storage has been deactivated!");
    }
}

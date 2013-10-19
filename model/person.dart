part of contact;

class Person {
  // Person properties:
  int _id;
  String _firstname, _name, _email, _phone;
  
  int get id => _id;
  set id(value) {
    if (value >= 1 && value <= 999999) _id = value;
  }
  String get firstname => _firstname;
  set firstname(value) {
    if (value != null && !value.isEmpty) _firstname = value;
  }
  String get name => _name;
  set name(value) {
    if (value != null && !value.isEmpty) _name = value;
  }
  String get email => _email;
  set email(value) {
    if (value != null && !value.isEmpty) _email = value;
  }
  String get phone => _phone;
  set phone(value) {
    if (value != null && !value.isEmpty) _phone = value;
  }

  // constructor:
  Person(id, firstname, name, email, phone) {
    this.id = id;
    this.firstname = firstname;
    this.name = name;
    this.email = email;
    this.phone = phone;
  }
  //Person.sameOwner(Person per): owner = per.id;
  Person.sameOwnerInit(Person per): this(per.id, "Alexandre", "April", "example@gmail.com", "418-123-1234");
  
  Person.fromJson(Map json) {
    this.id = json["id"];
    this.firstname = json["firstname"];
    this.name = json["name"];
    this.email = json["email"];
    this.phone = json["phone"];
   }
  
  String toJson(){
    var per = new Map<String, Object>();
    per["id"] = id;
    per["firstname"] = firstname;
    per["name"] = name;
    per["email"] = email;
    per["phone"] = phone;
    var pers = stringify(per);
    return pers;
  }
}


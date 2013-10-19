part of contact;

class Person {
  // Person properties:
  int _id;
  String _firstname;
  
  int get id => _id;
  set id(value) {
    if (value >= 1 && value <= 999999) _id = value;
  }
  
  String get firstname => _firstname;
  set firstname(value) {
    if (value != null && !value.isEmpty) _firstname = value;
  }

  // constructor:
  Person(id, firstname) {
    this.id = id;
    this.firstname = firstname;
  }
  //Person.sameOwner(Person per): owner = per.id;
  Person.sameOwnerInit(Person per): this(per.id, "Alex");
  
  Person.fromJson(Map json) {
    this.id = json["id"];
    this.firstname = json["firstname"];
   }
  
  String toJson(){
    var per = new Map<String, Object>();
    per["id"] = id;
    per["firstname"] = firstname;
    var pers = stringify(per);
    return pers;
  }
}


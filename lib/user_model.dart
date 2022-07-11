import 'dart:convert';

class Data {
  String? id;
  String? category;
  String? subcategory;
  String? title;
  String? publish;
  String? description;
  String? imgpath;
  String? deleted;
  String? added_by;
  String? dt;
  String? type;
  Data({
    this.id,
    this.category,
    this.subcategory,
    this.title,
    this.publish,
    this.description,
    this.imgpath,
    this.deleted,
    this.added_by,
    this.dt,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'subcategory': subcategory,
      'title': title,
      'publish': publish,
      'description': description,
      'imgpath': imgpath,
      'deleted': deleted,
      'added_by': added_by,
      'dt': dt,
      'type': type,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'],
      category: map['category'],
      subcategory: map['subcategory'],
      title: map['title'],
      publish: map['publish'],
      description: map['description'],
      imgpath: map['imgpath'],
      deleted: map['deleted'],
      added_by: map['added_by'],
      dt: map['dt'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));
}

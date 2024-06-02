class Course {
  int? id;
  String? coursename;
  String? coursedescription;
  String? coursethumbnail;
  bool? isRequire;

  Course({this.id, this.coursename, this.coursedescription, this.coursethumbnail, this.isRequire});

  // Kod yazilmaz!
  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coursename = json['coursename'];
    coursedescription = json['coursedescription'];
    isRequire = json['isRequire'];
  }

  // Kod yazilmaz!
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['coursename'] = coursename;
    data['coursedescription'] = coursedescription;
    data['coursethumbnail'] = coursethumbnail;
    return data;
  }
}

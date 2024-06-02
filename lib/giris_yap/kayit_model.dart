class Kullanici_Kayit {
  String? firstName;
  String? lastName;
  String? userName;
  String? password;
  String? email;
  bool? isAvailable;
  int? genderId;
  int? rankId;
  List<String>? roles;

  Kullanici_Kayit(
      {this.firstName,
        this.lastName,
        this.userName,
        this.password,
        this.email,
        this.isAvailable,
        this.genderId,
        this.rankId,
        this.roles});

  Kullanici_Kayit.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    password = json['password'];
    email = json['email'];
    isAvailable = json['isAvailable'];
    genderId = json['genderId'];
    rankId = json['rankId'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['email'] = this.email;
    data['isAvailable'] = this.isAvailable;
    data['genderId'] = this.genderId;
    data['rankId'] = this.rankId;
    data['roles'] = this.roles;
    return data;
  }
}
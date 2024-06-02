class Kullanici_Giris {
  String? userName;
  String? password;

  Kullanici_Giris({this.userName, this.password});

  Kullanici_Giris.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['password'] = this.password;
    return data;
  }
}
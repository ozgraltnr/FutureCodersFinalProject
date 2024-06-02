class Question {
  int? Id;
  String? QuestionText;
  String? QuestionType;
  String? QuestionOptions;

  Question({this.Id, this.QuestionText, this.QuestionType, this.QuestionOptions});

  // Kod yazilmaz!
  Question.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    QuestionText = json['QuestionText'];
    QuestionType = json['QuestionType'];
    QuestionOptions = json['QuestionOptions'];
  }

  // Kod yazilmaz!
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = Id;
    data['QuestionText'] = QuestionText;
    data['QuestionType'] = QuestionType;
    data['QuestionOptions'] = QuestionOptions;
    return data;
  }
}


class QuestionAnswer {
  int? Id;
  int? UserId;
  String? User;
  String? QuestionOptionId;
  String? QuestionOption;

  QuestionAnswer({this.Id, this.UserId, this.User, this.QuestionOptionId, this.QuestionOption});

  // Kod yazilmaz!
  QuestionAnswer.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    UserId = json['UserId'];
    User = json['User'];
    QuestionOptionId = json['QuestionOptionId'];
    QuestionOption = json['QuestionOption'];
  }

  // Kod yazilmaz!
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = Id;
    data['UserId'] = UserId;
    data['User'] = User;
    data['QuestionOptionId'] = QuestionOptionId;
    data['QuestionOption'] = QuestionOption;
    return data;
  }
}


class QuestionOption {
  int? Id;
  String? Answer;
  bool? IsTrue;
  String? QuestionOptionId;
  int? OrderNumber;
  int? QuestionId;
  String? Question;
  QuestionOption({this.Id, this.Answer, this.IsTrue, this.OrderNumber, this.QuestionId, this.Question});

  // Kod yazilmaz!
  QuestionOption.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Answer = json['Answer'];
    IsTrue = json['IsTrue'];
    OrderNumber = json['OrderNumber'];
    QuestionId = json['QuestionId'];
    Question = json['Queston'];
  }

  // Kod yazilmaz!
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = Id;
    data['Answer'] = Answer;
    data['IsTrue'] = IsTrue;
    data['OrderNumber'] = OrderNumber;
    data['QuestionId'] = QuestionId;
    data['Question'] = Question;
    return data;
  }
}


class QuestionType {
  int? Id;
  String? Name;

  QuestionType({this.Id, this.Name});

  // Kod yazilmaz!
  QuestionType.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Name = json['Answer'];
  }

  // Kod yazilmaz!
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = Id;
    data['Name'] = Name;
    return data;
  }
}



class UserModel {
  String name;
  int score;
  String number;

  UserModel({required this.name, required this.number, required this.score});

  Map<String, dynamic> toJson() => {
        'name': name,
        'score': score,
        'number': number,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        score: json['score'],
        number: json['number'],
      );
}

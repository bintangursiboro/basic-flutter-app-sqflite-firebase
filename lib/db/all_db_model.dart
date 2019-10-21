class DataModel {
  int id;
  final String name;
  final String nim;
  DataModel({this.id, this.name, this.nim});

  Map<String, dynamic> toMap() => {
        'name': this.name,
        'nim': this.nim,
      };

  factory DataModel.fromDB(Map<String, dynamic> json) =>
      DataModel(id: json['id'], name: json['name'], nim: json['nim']);
}

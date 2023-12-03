class DonorModel {
  String? id;
  String? name;
  String? phone;
  String? group;
  DonorModel({
    this.id = '',
    required this.name,
    required this.phone,
    required this.group,
  });

  factory DonorModel.fromMap(Map<String, dynamic> map, id) {
    return DonorModel(
        name: map['name'], phone: map['phone'], group: map['group'], id: id);
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      "phone": phone,
      "group": group,
    };
  }
}

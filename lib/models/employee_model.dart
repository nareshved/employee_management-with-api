import 'dart:developer';

class EmployeeDataModel {
  List<EmployeeModel>? employeeList;

  EmployeeDataModel({required this.employeeList});

  factory EmployeeDataModel.fromJson(Map<String, dynamic> json) {
    List<EmployeeModel> eachEmployeeModel = [];

    for (Map<String, dynamic> eachMap in json["employeeList"]) {
      var eachUser = EmployeeModel.fromJson(eachMap);
      eachEmployeeModel.add(eachUser);
      log("this is each user data $eachUser");
    }

    return EmployeeDataModel(employeeList: eachEmployeeModel);
  }
}

class EmployeeModel {
  String? createdAt;
  String? name;
  String? avatar;
  String? emailId;
  String? id;
  String? mobile;
  String? country;
  String? state;
  String? district;
  String? email;

  EmployeeModel(
      {required this.avatar,
      required this.country,
      required this.createdAt,
      required this.district,
      required this.email,
      required this.emailId,
      required this.id,
      required this.mobile,
      required this.name,
      required this.state});

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
        avatar: json["avatar"] ??
            "avatar", // if null recieve in this key automatically handle
        country: json["country"] ?? "country",
        createdAt: json["createdAt"] ?? "createdAt",
        district: json["district"] ?? "district",
        email: json["email"] ?? "email",
        emailId: json["emailId"] ?? "emailId",
        id: json["id"] ?? "id",
        mobile: json["mobile"] ?? "mobile",
        name: json["name"] ?? "name",
        state: json["state"] ?? "state");
  }

  toJson({
    String? createdAt,
    String? name,
    String? avatar,
    String? emailId,
    String? id,
    String? mobile,
    String? country,
    String? state,
    String? district,
  }) {
    return {
      "createdAt": createdAt,
      "name": name,
      "avatar": avatar,
      "emailId": emailId,
      "mobile": mobile,
      "country": country,
      "state": state,
      "district": district,
      "id": id,
    };
  }
}

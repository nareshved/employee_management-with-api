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
  String? mobile;
  String? country;
  String? state;
  String? district;
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;

  EmployeeModel(
      {this.createdAt,
      this.name,
      this.avatar,
      this.emailId,
      this.mobile,
      this.country,
      this.state,
      this.district,
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber});

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
      state: json["state"] ?? "state",
      firstName: json["firstName"] ?? "firstName",
      lastName: json["lastName"] ?? "lastName",
      phoneNumber: json["phoneNumber"] ?? "phoneNumber",
    );
  }

  toJson({
    String? createdAt,
    String? name,
    String? avatar,
    String? emailId,
    String? mobile,
    String? country,
    String? state,
    String? district,
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
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
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phoneNumber": phoneNumber,
    };
  }
}

// class EmployeeModel {
//   String? createdAt;
//   String? name;
//   String? avatar;
//   String? emailId;
//   String? mobile;
//   String? country;
//   String? state;
//   String? district;
//   String? id;
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? phoneNumber;

//   EmployeeModel(
//       {this.createdAt,
//       this.name,
//       this.avatar,
//       this.emailId,
//       this.mobile,
//       this.country,
//       this.state,
//       this.district,
//       this.id,
//       this.firstName,
//       this.lastName,
//       this.email,
//       this.phoneNumber});

//   EmployeeModel.fromJson(Map<String, dynamic> json) {
//     createdAt = json['createdAt'];
//     name = json['name'];
//     avatar = json['avatar'];
//     emailId = json['emailId'];
//     mobile = json['mobile'];
//     country = json['country'];
//     state = json['state'];
//     district = json['district'];
//     id = json['id'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     email = json['email'];
//     phoneNumber = json['phone_number'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['createdAt'] = createdAt;
//     data['name'] = name;
//     data['avatar'] = avatar;
//     data['emailId'] = emailId;
//     data['mobile'] = mobile;
//     data['country'] = country;
//     data['state'] = state;
//     data['district'] = district;
//     data['id'] = id;
//     data['first_name'] = firstName;
//     data['last_name'] = lastName;
//     data['email'] = email;
//     data['phone_number'] = phoneNumber;
//     return data;
//   }
// }

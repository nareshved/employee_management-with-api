class CreateUserModel {
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

  CreateUserModel(
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

  CreateUserModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    avatar = json['avatar'];
    emailId = json['emailId'];
    mobile = json['mobile'];
    country = json['country'];
    state = json['state'];
    district = json['district'];
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['createdAt'] = createdAt;
    data['name'] = name;
    data['avatar'] = avatar;
    data['emailId'] = emailId;
    data['mobile'] = mobile;
    data['country'] = country;
    data['state'] = state;
    data['district'] = district;
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}

import 'dart:developer';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:employee_management/app_controllers/api_helper/provider/employee_provider.dart';
import 'package:employee_management/models/countries_model.dart';
import 'package:employee_management/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/text_form_field.dart';

class EmployeeEditPage extends StatefulWidget {
  final EmployeeModel editEmployee;

  const EmployeeEditPage({super.key, required this.editEmployee});

  static final employeeEditKey = GlobalKey<FormState>();

  static TextEditingController createdAtController = TextEditingController();
  static TextEditingController nameController = TextEditingController();
  static TextEditingController avatarController = TextEditingController();
  static TextEditingController emailIdController = TextEditingController();
  static TextEditingController idController = TextEditingController();
  static TextEditingController mobileController = TextEditingController();
  static TextEditingController stateController = TextEditingController();
  static TextEditingController districtController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  @override
  State<EmployeeEditPage> createState() => _EmployeeEditPageState();

  static void editEmployeeData({
    required String createdAt,
    required String name,
    required String avatar,
    required String emailId,
    required String id,
    required String mobile,
    required String state,
    required String district,
    required String email,
  }) {
    createdAtController.text = createdAt;
    nameController.text = name;
    avatarController.text = avatar;
    emailIdController.text = emailId;
    idController.text = id;
    mobileController.text = mobile;
    stateController.text = state;
    districtController.text = district;
    emailController.text = email;
  }
}

class _EmployeeEditPageState extends State<EmployeeEditPage> {
  //String selectNewCountry = "Initial Value";

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Employees"),
      ),
      body: SafeArea(
        child: Consumer<EmployeeProvider>(builder: (context, provider, child) {
          if (provider.countries.isEmpty) {
            provider.fetchCountries();
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(14.0),
            child: ListView(
              children: [
                Form(
                  key: EmployeeEditPage.employeeEditKey,
                  child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      employeeEditTextField(
                        editValidator: (value) {
                          if (value!.isEmpty) {
                            return "fill empty blanks";
                          }
                        },
                        keyboard: TextInputType.text,
                        feildName: "CreatedAt",
                        lableName: "CreatedAt",
                        controller: EmployeeEditPage.createdAtController,
                      ),
                      employeeEditTextField(
                        editValidator: (value) {
                          if (value!.isEmpty) {
                            return "fill empty blanks";
                          }
                        },
                        keyboard: TextInputType.text,
                        feildName: "Name",
                        lableName: "Name",
                        controller: EmployeeEditPage.nameController,
                      ),
                      employeeEditTextField(
                        editValidator: (value) {
                          if (value!.isEmpty) {
                            return "fill empty blanks";
                          }
                        },
                        keyboard: TextInputType.text,
                        feildName: "Avatar",
                        lableName: "Avatar",
                        controller: EmployeeEditPage.avatarController,
                      ),
                      employeeEditTextField(
                        editValidator: (value) {
                          if (value!.isEmpty) {
                            return "fill empty blanks";
                          }
                        },
                        keyboard: TextInputType.text,
                        feildName: "Email Id",
                        lableName: "Email Id",
                        controller: EmployeeEditPage.emailIdController,
                      ),
                      employeeEditTextField(
                        editValidator: (value) {
                          if (value!.isEmpty) {
                            return "fill empty blanks";
                          }
                        },
                        keyboard: TextInputType.number,
                        feildName: "Id",
                        lableName: "Id",
                        controller: EmployeeEditPage.idController,
                      ),
                      employeeEditTextField(
                        editValidator: (value) {
                          if (value!.isEmpty) {
                            return "fill empty blanks";
                          } else if (value.length < 10) {
                            return "not valid mobile number ";
                          }
                        },
                        keyboard: TextInputType.number,
                        feildName: "Mobile",
                        lableName: "Mobile",
                        controller: EmployeeEditPage.mobileController,
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 80, child: Text("Country")),
                          const SizedBox(
                            width: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(width: 0.7)),
                              child: DropDownTextField(
                                initialValue: widget.editEmployee.country,
                                padding: const EdgeInsets.only(top: 10),
                                enableSearch: false,
                                textFieldDecoration: const InputDecoration(
                                    constraints: BoxConstraints(maxWidth: 300),
                                    prefixIcon: Icon(
                                      Icons.flag,
                                      color: Colors.grey,
                                    ),
                                    labelStyle: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.only(left: 10, top: 9),
                                    hintText: "Select Country"),
                                dropDownList: provider.countries
                                    .map<DropDownValueModel>(
                                        (CountriesModel newdata) {
                                  //     log(newdata.country.toString());
                                  return DropDownValueModel(
                                      name: newdata.country.toString(),
                                      value: newdata.id.toString());
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    // widget.editEmployee.country = value;
                                    //selectNewCountry = val.country;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      employeeEditTextField(
                        editValidator: (value) {
                          if (value!.isEmpty) {
                            return "fill empty blanks";
                          }
                        },
                        keyboard: TextInputType.text,
                        feildName: "State",
                        lableName: "State",
                        controller: EmployeeEditPage.stateController,
                      ),
                      employeeEditTextField(
                        editValidator: (value) {
                          if (value!.isEmpty) {
                            return "fill empty blanks";
                          }
                        },
                        keyboard: TextInputType.text,
                        feildName: "District",
                        lableName: "District",
                        controller: EmployeeEditPage.districtController,
                      ),
                      employeeEditTextField(
                        editValidator: (value) {
                          if (value!.isEmpty) {
                            return "fill empty blanks";
                          }
                        },
                        keyboard: TextInputType.text,
                        feildName: "Email",
                        lableName: "Email",
                        controller: EmployeeEditPage.emailController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      OutlinedButton.icon(
                          onPressed: () {
                            if (EmployeeEditPage.employeeEditKey.currentState!
                                .validate()) {
                              if (EmployeeEditPage.createdAtController.text
                                      .trim()
                                      .isNotEmpty &&
                                  EmployeeEditPage.nameController.text
                                      .trim()
                                      .isNotEmpty &&
                                  EmployeeEditPage.avatarController.text
                                      .trim()
                                      .isNotEmpty &&
                                  EmployeeEditPage.emailIdController.text
                                      .trim()
                                      .isNotEmpty &&
                                  EmployeeEditPage.idController.text
                                      .trim()
                                      .isNotEmpty &&
                                  EmployeeEditPage.mobileController.text
                                      .trim()
                                      .isNotEmpty &&
                                  EmployeeEditPage.stateController.text
                                      .trim()
                                      .isNotEmpty &&
                                  EmployeeEditPage.districtController.text
                                      .trim()
                                      .isNotEmpty &&
                                  EmployeeEditPage.emailController.text
                                      .trim()
                                      .isNotEmpty) {
                                var saveEmp = EmployeeModel(
                                    avatar: EmployeeEditPage
                                        .avatarController.text
                                        .trim(),
                                    country: widget.editEmployee.country,
                                    createdAt: EmployeeEditPage
                                        .createdAtController.text
                                        .trim(),
                                    district: EmployeeEditPage
                                        .districtController.text
                                        .trim(),
                                    email: EmployeeEditPage.emailController.text
                                        .trim(),
                                    emailId: EmployeeEditPage
                                        .emailIdController.text
                                        .trim(),
                                    id: EmployeeEditPage.idController.text
                                        .trim(),
                                    mobile: EmployeeEditPage
                                        .mobileController.text
                                        .trim(),
                                    name: EmployeeEditPage.nameController.text
                                        .trim(),
                                    state: EmployeeEditPage.stateController.text
                                        .trim());

                                provider.editEmployee(saveEmp.id!, saveEmp);
                                //     provider.fetchAllEmployeesById(saveEmp.id!);

                                log("all details save YOU CHANGED ID IS ${saveEmp.id!}");
                              }
                            }
                            Navigator.pop(context);
                          },
                          label: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.save),
                              SizedBox(
                                width: mq.width * 0.012,
                              ),
                              const Text("Save Employee"),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

import 'dart:developer';

import 'package:employee_management/app_controllers/api_helper/provider/employee_provider.dart';
import 'package:employee_management/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/text_form_field.dart';

class EmployeeEditPage extends StatelessWidget {
  final EmployeeModel editEmployee;

  EmployeeEditPage({super.key, required this.editEmployee});

  static const employeeEditKey = GlobalKey<FormState>;

  String? selectNewCountry;

  TextEditingController createdAt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Employees"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<EmployeeProvider>(builder: (context, provider, child) {
          if (provider.countries.isEmpty) {
            provider.fetchCountries();
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  employeeEditTextField(
                    keyboard: TextInputType.text,
                    feildName: "CreatedAt",
                    lableName: "CreatedAt",
                    controller: createdAt,
                  ),
                  employeeEditTextField(
                    keyboard: TextInputType.text,
                    feildName: "Name",
                    lableName: "Name",
                    controller: createdAt,
                  ),
                  employeeEditTextField(
                    keyboard: TextInputType.text,
                    feildName: "Avatar",
                    lableName: "Avatar",
                    controller: createdAt,
                  ),
                  employeeEditTextField(
                    keyboard: TextInputType.text,
                    feildName: "Email Id",
                    lableName: "Email Id",
                    controller: createdAt,
                  ),
                  employeeEditTextField(
                    keyboard: TextInputType.number,
                    feildName: "Id",
                    lableName: "Id",
                    controller: createdAt,
                  ),
                  employeeEditTextField(
                    keyboard: TextInputType.number,
                    feildName: "Mobile",
                    lableName: "Mobile",
                    controller: createdAt,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 80, child: Text("Country")),
                      const SizedBox(
                        width: 14,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: DropdownButton(
                          hint: const Text("Select Country"),
                          items: provider.countries
                              .map(
                                (e) => DropdownMenuItem(
                                    value: e, child: Text(e.country!)),
                              )
                              .toList(),
                          onChanged: (value) {
                            log("user select country -- $value");
                          },
                        ),
                      ),
                    ],
                  ),
                  employeeEditTextField(
                    keyboard: TextInputType.text,
                    feildName: "State",
                    lableName: "State",
                    controller: createdAt,
                  ),
                  employeeEditTextField(
                    keyboard: TextInputType.text,
                    feildName: "District",
                    lableName: "District",
                    controller: createdAt,
                  ),
                  employeeEditTextField(
                    keyboard: TextInputType.text,
                    feildName: "Email",
                    lableName: "Email",
                    controller: createdAt,
                  ),
                  OutlinedButton.icon(
                      onPressed: () {},
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
            ],
          );
        }),
      ),
    );
  }
}

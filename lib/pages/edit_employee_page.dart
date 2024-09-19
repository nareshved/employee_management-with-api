// import 'package:dropdown_textfield/dropdown_textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../app_controllers/api_helper/provider/employee_provider.dart';
// import '../models/countries_model.dart';
// import '../models/employee_model.dart';
// import '../widgets/text_form_field.dart';
// import 'edit_employee.dart';

// class EditEmployeePage extends StatelessWidget {
//   final EmployeeModel editEmployee;
//   const EditEmployeePage({super.key, required this.editEmployee});

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController createdAtController =
//         TextEditingController(text: editEmployee.createdAt);
//     TextEditingController nameController =
//         TextEditingController(text: editEmployee.name);
//     TextEditingController avatarController =
//         TextEditingController(text: editEmployee.avatar);
//     TextEditingController emailIdController =
//         TextEditingController(text: editEmployee.emailId);
//     TextEditingController idController =
//         TextEditingController(text: editEmployee.id);
//     TextEditingController mobileController =
//         TextEditingController(text: editEmployee.mobile);
//     TextEditingController stateController =
//         TextEditingController(text: editEmployee.state);
//     TextEditingController districtController =
//         TextEditingController(text: editEmployee.district);
//     TextEditingController emailController =
//         TextEditingController(text: editEmployee.email);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Edit Employees-Demo"),
//       ),
//       body: SafeArea(
//         child: Consumer<EmployeeProvider>(builder: (context, provider, child) {
//           if (provider.countries.isEmpty) {
//             provider.fetchCountries();
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return Padding(
//             padding: const EdgeInsets.all(14.0),
//             child: ListView(
//               children: [
//                 Form(
//                   key: EmployeeEditPage.employeeEditKey,
//                   child: Column(
//                     //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       employeeEditTextField(
//                         editValidator: (value) {
//                           if (value!.isEmpty) {
//                             return "fill empty blanks";
//                           }
//                         },
//                         keyboard: TextInputType.text,
//                         feildName: "CreatedAt",
//                         lableName: "CreatedAt",
//                         controller: EmployeeEditPage.createdAtController,
//                       ),
//                       employeeEditTextField(
//                         editValidator: (value) {
//                           if (value!.isEmpty) {
//                             return "fill empty blanks";
//                           }
//                         },
//                         keyboard: TextInputType.text,
//                         feildName: "Name",
//                         lableName: "Name",
//                         controller: nameController,
//                       ),
//                       employeeEditTextField(
//                         editValidator: (value) {
//                           if (value!.isEmpty) {
//                             return "fill empty blanks";
//                           }
//                         },
//                         keyboard: TextInputType.text,
//                         feildName: "Avatar",
//                         lableName: "Avatar",
//                         controller: avatarController,
//                       ),
//                       employeeEditTextField(
//                         editValidator: (value) {
//                           if (value!.isEmpty) {
//                             return "fill empty blanks";
//                           }
//                         },
//                         keyboard: TextInputType.text,
//                         feildName: "Email Id",
//                         lableName: "Email Id",
//                         controller: emailIdController,
//                       ),
//                       employeeEditTextField(
//                         editValidator: (value) {
//                           if (value!.isEmpty) {
//                             return "fill empty blanks";
//                           }
//                         },
//                         keyboard: TextInputType.number,
//                         feildName: "Id",
//                         lableName: "Id",
//                         controller: idController,
//                       ),
//                       employeeEditTextField(
//                         editValidator: (value) {
//                           if (value!.isEmpty) {
//                             return "fill empty blanks";
//                           } else if (value.length < 10) {
//                             return "not valid mobile number ";
//                           }
//                         },
//                         keyboard: TextInputType.number,
//                         feildName: "Mobile",
//                         lableName: "Mobile",
//                         controller: mobileController,
//                       ),
//                       Row(
//                         children: [
//                           const SizedBox(width: 80, child: Text("Country")),
//                           const SizedBox(
//                             width: 14,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 8),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(7),
//                                   border: Border.all(width: 0.7)),
//                               // child: DropDownTextField(
//                               //   initialValue: editEmployee.country,
//                               //   padding: const EdgeInsets.only(top: 10),
//                               //   enableSearch: false,
//                               //   textFieldDecoration: const InputDecoration(
//                               //       constraints: BoxConstraints(maxWidth: 300),
//                               //       prefixIcon: Icon(
//                               //         Icons.flag,
//                               //         color: Colors.grey,
//                               //       ),
//                               //       labelStyle: TextStyle(
//                               //           fontSize: 15, color: Colors.black),
//                               //       border: InputBorder.none,
//                               //       contentPadding:
//                               //           EdgeInsets.only(left: 10, top: 9),
//                               //       hintText: "Select Country"),
//                               //   dropDownList: provider.countries
//                               //       .map<DropDownValueModel>(
//                               //           (CountriesModel newdata) {
//                               //     //     log(newdata.country.toString());
//                               //     return DropDownValueModel(
//                               //         name: newdata.country.toString(),
//                               //         value: newdata.id.toString());
//                               //   }).toList(),
//                               //   onChanged: (value) {},
//                               // ),
//                               child: SizedBox(),
//                             ),
//                           ),
//                         ],
//                       ),
//                       employeeEditTextField(
//                         editValidator: (value) {
//                           if (value!.isEmpty) {
//                             return "fill empty blanks";
//                           }
//                         },
//                         keyboard: TextInputType.text,
//                         feildName: "State",
//                         lableName: "State",
//                         controller: stateController,
//                       ),
//                       employeeEditTextField(
//                         editValidator: (value) {
//                           if (value!.isEmpty) {
//                             return "fill empty blanks";
//                           }
//                         },
//                         keyboard: TextInputType.text,
//                         feildName: "District",
//                         lableName: "District",
//                         controller: districtController,
//                       ),
//                       employeeEditTextField(
//                         editValidator: (value) {
//                           if (value!.isEmpty) {
//                             return "fill empty blanks";
//                           }
//                         },
//                         keyboard: TextInputType.text,
//                         feildName: "Email",
//                         lableName: "Email",
//                         controller: emailController,
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       OutlinedButton.icon(
//                           onPressed: () {
//                             var employee = new EmployeeModel(
//                               id: idController.text,
//                               avatar: avatarController.text,
//                               country: "",
//                               createdAt: createdAtController.text,
//                               district: districtController.text,
//                               email: emailController.text,
//                               emailId: emailIdController.text,
//                               mobile: mobileController.text,
//                               name: nameController.text,
//                               state: stateController.text,
//                             );
//                             provider.editEmployee(employee.id!, employee);
//                             // provider.fetchAllEmployeesById(saveEmp.id!);

//                             // Navigator.pop(context);
//                           },
//                           label: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Icon(Icons.save),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               const Text("Save Employee"),
//                             ],
//                           )),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }

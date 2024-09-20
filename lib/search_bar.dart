import 'dart:convert';
import 'dart:developer';
import 'package:employee_management/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  EmployeeModel? employeeModel; // Make it nullable

  TextEditingController id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employees By Id"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.search,
                      keyboardType: TextInputType.number,
                      controller: id,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          labelText: 'Enter Employee ID'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: IconButton(
                        onPressed: () async {
                          if (id.text.isNotEmpty) {
                            try {
                              var response = await http.get(Uri.parse(
                                  "https://669b3f09276e45187d34eb4e.mockapi.io/api/v1/employee/${id.text}"));
                              if (response.statusCode == 200) {
                                var data = jsonDecode(response.body);
                                setState(() {
                                  employeeModel = EmployeeModel.fromJson(data);
                                });
                              } else {
                                setState(() {
                                  employeeModel =
                                      null; // Handle case when no data is returned
                                });
                              }
                            } catch (e) {
                              log('Error fetching employee data: $e');
                              setState(() {
                                employeeModel =
                                    null; // Reset model if there's an error
                              });
                            }
                          }
                        },
                        icon: const Icon(Icons.search)),
                  )
                ],
              ),
              const SizedBox(height: 20),
              employeeModel == null
                  ? const Text('No employee found') // Show message when no data
                  : ListTile(
                      onTap: () {},
                      tileColor: Colors.yellow,
                      leading: CircleAvatar(
                        child: Text(employeeModel!.id!),
                      ),
                      title: Text(employeeModel!.name ??
                          'Unknown Name'), // Safely access name
                      subtitle: Text(employeeModel!.createdAt!),
                      trailing: Text(employeeModel!.emailId!),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

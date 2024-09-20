import 'package:employee_management/app_controllers/api_helper/api_helper.dart';
import 'package:flutter/material.dart';

import 'text_form_field.dart';

deleteEmployeeAlertBox(BuildContext context,
    {required TextEditingController deleteController}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Delete Employee"),
      content: const Text("are you sure to delete"),
      actions: [
        employeeEditTextField(
          controller: deleteController,
          feildName: "Employee Id",
          keyboard: TextInputType.number,
          lableName: "Enter Id here",
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel")),
            OutlinedButton(
                onPressed: () {
                  ApiHelper.deleteEmployee(deleteController.text);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("employee deleted !")));
                },
                child: const Text("Delete")),
          ],
        ),
      ],
    ),
  );
}

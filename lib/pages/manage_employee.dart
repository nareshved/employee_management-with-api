import 'package:employee_management/search_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/card_widget.dart';
import 'create_employee.dart';

class ManageEmployeePage extends StatelessWidget {
  const ManageEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Employees"),
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchBarWidget())),
              child: const CardWidgetGrid(
                title: "Get employee by ID",
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateEmployeePage())),
              child: CardWidgetGrid(
                title: "Create employee",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

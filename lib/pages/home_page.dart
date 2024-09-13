import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_management/pages/add_employee.dart';
import 'package:employee_management/pages/details_employee.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../app_controllers/api_helper/api_helper.dart';
import '../app_controllers/api_helper/provider/employee_provider.dart';
import '../widgets/search_controller.dart';
import 'edit_employee.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ApiHelper.getAllEmployees(); // get all employees first time is open
    // _searchController.addListener(EmployeeProvider()
    //     .filterEmployees(searchController: _searchController));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employees"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddEmployeePage(),
              ));
        },
      ),
      body: SafeArea(child: Consumer<EmployeeProvider>(
        builder: (context, provider, child) {
          if (provider.employees.isEmpty) {
            provider.fetchAllEmployees();
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return provider.employees.isNotEmpty
              ? Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(12),
                        child: searchTextField(
                            searchController: _searchController)),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: provider.employees.length,
                        itemBuilder: (context, index) {
                          final eachEmployee = provider.employees[index];

                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EmployeeDetailsPage(
                                      detailsEmployee: eachEmployee,
                                    ),
                                  ));
                            },
                            leading: CircleAvatar(
                              child: CachedNetworkImage(
                                imageUrl: eachEmployee.avatar!,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error_outline),
                              ),
                            ),
                            title: Text(eachEmployee.name!),
                            subtitle: Text(eachEmployee.state!),
                            trailing: SizedBox(
                              width: 80,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EmployeeEditPage(
                                                editEmployee: eachEmployee,
                                              ),
                                            ));
                                      },
                                      icon: const Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.delete))
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              : Center(child: Lottie.asset("assets/lottie_home/users.json"));
        },
      )),
    );
  }
}

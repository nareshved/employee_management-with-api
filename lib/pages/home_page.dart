import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_management/pages/manage_employee.dart';
import 'package:employee_management/pages/details_employee.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../app_controllers/api_helper/api_helper.dart';
import '../app_controllers/api_helper/provider/employee_provider.dart';
import '../demo_lottie.dart';
import '../widgets/delete_alert_box.dart';
import 'edit_employee.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
//  final TextEditingController _searchController = TextEditingController();
  final TextEditingController deleteController = TextEditingController();

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
        child: const Icon(Icons.forward),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ManageEmployeePage(),
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
                    // Padding(
                    //     padding: const EdgeInsets.all(12),
                    //     child: searchTextField(
                    //         searchController: _searchController)),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     OutlinedButton(
                    //         onPressed: () {},
                    //         child: const Text("Get Employee by id")),
                    //     OutlinedButton(
                    //         onPressed: () {},
                    //         child: const Text("Create Employee")),
                    //   ],
                    // ),
                    // const Divider(
                    //   color: Colors.grey,
                    // ),

                    //      Flexible(child: const SearchBarWidget()),

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
                            subtitle: Text(eachEmployee.id!),
                            trailing: SizedBox(
                              width: 80,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        // EmployeeEditPage.editEmployeeData(
                                        //     createdAt: eachEmployee.createdAt!,
                                        //     name: eachEmployee.name!,
                                        //     avatar: eachEmployee.avatar!,
                                        //     emailId: eachEmployee.emailId!,
                                        //     id: eachEmployee.id!,
                                        //     mobile: eachEmployee.mobile!,
                                        //     state: eachEmployee.state!,
                                        //     district: eachEmployee.district!,
                                        //     email: eachEmployee.email!);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EmployeeEditPage(
                                                editEmployee: eachEmployee,
                                              ),
                                            ));
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
                                      onPressed: () {
                                        deleteEmployeeAlertBox(context,
                                            deleteController: deleteController);
                                      },
                                      icon: const Icon(Icons.delete))
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DemoLottie(),
                              ));
                        },
                        child: const Text("lottile files"))
                  ],
                )
              : Center(
                  child: Lottie.asset(
                      "assets/lottie/Animation - 1726742651273.json"));
        },
      )),
    );
  }
}

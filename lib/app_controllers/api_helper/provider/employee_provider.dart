import 'dart:developer';
import 'package:employee_management/app_controllers/api_helper/api_helper.dart';
import 'package:employee_management/models/countries_model.dart';
import 'package:employee_management/models/create_user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../models/employee_model.dart';

class EmployeeProvider extends ChangeNotifier {
  List<EmployeeModel> _employees = [];
  final List<dynamic> _employeesById = [];
  List<CountriesModel> _countries = [];

  List<EmployeeModel> get employees => _employees;
  List<dynamic> get employeesByIdList => _employeesById;
  List<CountriesModel> get countries => _countries;
  List<EmployeeModel> get filterEmployeess => _filteredEmployees;

  // for : search bar by id in home Page
  //  List<Employee> _employees = []; dont repeat same code for add getAllEmployees to add in this list so i used first list for both _employees
  // and fetchAllEmployees function also given below

  List<EmployeeModel> _filteredEmployees =
      []; // user search query added in this list

  Future<void> fetchAllEmployees() async {
    try {
      _employees = await ApiHelper.getAllEmployees();
      _filteredEmployees = await ApiHelper.getAllEmployees(); // for search bar
      notifyListeners();
    } catch (e) {
      log("get allEmplyoee provider page error : ${e.toString()}");
    }
  }

  // Future<void> createEmployee(CreateUserModel user) async {
  //   try {
  //     await ApiHelper.createEmployee(user);
  //     notifyListeners();
  //   } catch (e) {
  //     log("error in employee provider page  $e");
  //   }
  // }

  Future<void> fetchAllEmployeesById(String id) async {
    try {
      var response = await ApiHelper.getAllEmployeesById(id);
      _employeesById.add(response);
      notifyListeners();
      log("provider fetch Employees By Id sucessfully: ${id.toString()}");
      log("provider Employees By Id list success add : $employeesByIdList");
    } catch (e) {
      log("fetchAllEmployeesById : ${e.toString()}");
    }
  }

  Future<void> editEmployee(String id, EmployeeModel employee) async {
    try {
      if (employee.id != null) {
        await ApiHelper.editEmployee(id, employee);
      } else {
        log("id should not be null");
      }
      notifyListeners();
    } catch (e) {
      log("edit employee : ${e.toString()}");
    }
  }

  Future<void> deleteEmployee(String id) async {
    try {
      await ApiHelper.deleteEmployee(id);
      notifyListeners();
    } catch (e) {
      log("employee not delete success in provider ${e.toString()}");
    }
  }

  Future<void> fetchCountries() async {
    try {
      _countries = await ApiHelper.getCountries();
      notifyListeners();
    } catch (e) {
      log("countries not added! in list in provider ${e.toString()}");
    }
  }

  // for user query in search bar text Editing controller
  // filterEmployees({required TextEditingController searchController}) {
  //   final query = searchController.text.trim();

  //   if (query.isNotEmpty) {
  //     notifyListeners();
  //     _filteredEmployees = _employees
  //         .where(
  //           (element) => element.id.toString().contains(query),
  //         )
  //         .toList();
  //   } else {
  //     notifyListeners();
  //     _filteredEmployees = _employees;
  //   }
  // }

  /// delete employee by id in alert box

  //Future<void> checkIdforDelete({required String id}) async {}
}

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../models/countries_model.dart';
import '../../models/employee_model.dart';

class ApiHelper {
  static const String apiUrl =
      "https://669b3f09276e45187d34eb4e.mockapi.io/api/v1/employee";

  static Future<List<EmployeeModel>> getAllEmployees() async {
    var uri = Uri.parse(apiUrl);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        //  log("api helper page response :  ${response.body}");
        var jsonData =
            jsonDecode(response.body) as List<dynamic>; // Ensure it's a list

        return jsonData
            .map((employeeData) => EmployeeModel.fromJson(employeeData))
            .toList();
      } else {
        throw Exception(
            'Failed to load employees. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log("api helper all employee error : ${e.toString()}");
      rethrow; // Re-throw the exception for proper error handling
    }
  }

  static Future<EmployeeModel> getAllEmployeesById(String id) async {
    var uri = Uri.parse("$apiUrl/$id");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final mData = jsonDecode(response.body);

      final eEmployee = EmployeeModel.fromJson(mData);
      log("fetch Employees By this Id : ${eEmployee.toString()}");
      return eEmployee;
    } else {
      throw Exception("Failed to load employee");
    }
  }

  static Future<void> createEmployee() async {
    //EmployeeModel employee
    var uri = Uri.parse(apiUrl);

    final response = await http.post(
      uri,
    );
    if (response.statusCode == 201) {
      log(response.body.toString());

      ///
    } else {
      throw Exception("Failed to create employee");

      ///
    }
  }

  static Future<void> editEmployee(String id, EmployeeModel employee) async {
    try {
      final response = await http.put(
        Uri.parse('$apiUrl/$id'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(employee.toJson()),
      );
      if (response.statusCode == 200) {
        log("Employee updated successfully");
      } else {
        log("Failed to edit employee: ${response.statusCode}");
      }
    } catch (ex) {
      log("Error occurred: $ex");
    }
  }

  static Future<void> deleteEmployee(String id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception("Failed to delete employee");
    } else {
      log("employee deleted success");
    }
  }

  static Future<List<CountriesModel>> getCountries() async {
    var countryUri =
        Uri.parse("https://669b3f09276e45187d34eb4e.mockapi.io/api/v1/country");
    final response = await http.get(countryUri);
    if (response.statusCode == 200) {
      log("countries response in api helper page :  $response");
      List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => CountriesModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load countries");
    }
  }
}







  // static Future<void> editEmployee(String id, EmployeeModel employee) async {
  //   final response = await http.put(
  //     Uri.parse('${apiUrl}employees/:$id'),
  //     headers: {"Content-Type": "application/json"},
  //     body: jsonEncode(employee.toJson()),
  //   );
  //   if (response.statusCode == 200) {
  //     throw Exception("Failed to edit employee");
  //   } else {
  //     log("Failed");
  //   }
  // }
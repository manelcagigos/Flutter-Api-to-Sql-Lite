// import 'package:api_to_sqlite/src/models/employee_model.dart';
// import 'package:api_to_sqlite/src/providers/db_provider.dart';
// import 'package:dio/dio.dart';

// class EmployeeApiProvider {
//   Future<List<Employee?>> getAllEmployees() async {
//     var url = "https://63c1812d376b9b2e647d7f5d.mockapi.io/elhobbit/v1/Peliculas/1/Personajes";
//     Response response = await Dio().get(url);

//     return (response.data as List).map((employee) {
//       // ignore: avoid_print
//       print('Inserting $employee');
//       DBProvider.db.createPersonajes(Employee.fromJson(employee));
//     }).toList();
//   }
// }
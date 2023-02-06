// import 'package:api_to_sqlite/src/models/employee_model.dart';
import 'package:api_to_sqlite/src/providers/db_provider.dart';
import 'package:dio/dio.dart';
import '../models/personajes_model.dart';

class PersonajesApiProvider {
  Future<List<Personajes?>> getAllPersonajes() async {
    var url =
        "https://demo4102486.mockable.io/Personajes";
    Response response = await Dio().get(url);

    return (response.data as List).map((personajes) {
      // ignore: avoid_print
      print('Inserting $personajes');
      DBProvider.db.createPersonajes(Personajes.fromJson(personajes));
    }).toList();
  }
}

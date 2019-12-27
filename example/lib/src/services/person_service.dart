import 'package:angular/angular.dart';
import 'package:essential_components/essential_components.dart';
import 'package:example/src/models/person.dart';

@Injectable()
class PersonService {

  RestClientGeneric rest;
  
  PersonService() {
    RestClientGeneric.basePath = '';
    RestClientGeneric.host = "localhost";
    RestClientGeneric.protocol = UriMuProtoType.http;
    RestClientGeneric.port = 8080;
    rest = RestClientGeneric<Person>(factories: {Person: (x) => Person.fromJson(x)});
  }

  Future<RestResponseGeneric> findAll({DataTableFilter filters}) {
    return rest.getAll('/exemple_data.json', queryParameters: filters?.getParams());
  }

}
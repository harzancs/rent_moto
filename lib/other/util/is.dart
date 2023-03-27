import 'package:rent_moto/constants/constants.dart';

class Is {
  static bool notNull(dynamic value) {
    return value != null;
  }

  static bool notNullOrBlank(dynamic value) {
    return value != EMPTY_STRING && value != null;
  }

  static bool notEmpty(List<dynamic> value) {
    return value is List ? value.length != 0 : false;
  }

  static bool notNullOrEmpty(List<dynamic> value) {
    return notNull(value) ? (value is List ? value.length != 0 : false) : false;
  }
}

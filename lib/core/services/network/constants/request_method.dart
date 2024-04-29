// Project imports:
import 'package:flutter_getx_clean_arch/core/utils/enum.dart';

enum RequestMethod {
  get,
  head,
  post,
  put,
  delete,
  connect,
  options,
  trace,
  patch,
}

extension RequestMethodX on RequestMethod {
  String get value => EnumUtils.getEnumValue(this).toUpperCase();
}

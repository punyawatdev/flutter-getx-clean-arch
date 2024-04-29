// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/core/utils/enum.dart';

enum RequestMethod {
  get,
  post,
  put,
  delete,
  patch,
}

void main() {
  group('EnumUtils.getEnumValue', () {
    final get = EnumUtils.getEnumValue(RequestMethod.get);
    final post = EnumUtils.getEnumValue(RequestMethod.post);
    final put = EnumUtils.getEnumValue(RequestMethod.put);
    final delete = EnumUtils.getEnumValue(RequestMethod.delete);
    final patch = EnumUtils.getEnumValue(RequestMethod.patch);

    test('Get enum to string value test', () async {
      // output is not enum
      expect(RequestMethod.get is String, false);
      expect(get is Enum, false);
    });

    test('Get enum raw value test', () async {
      expect(get, 'get');
      expect(post, 'post');
      expect(put, 'put');
      expect(delete, 'delete');
      expect(patch, 'patch');
    });

    test('Get enum uppercase value test', () async {
      expect(get.toUpperCase(), 'GET');
      expect(post.toUpperCase(), 'POST');
      expect(put.toUpperCase(), 'PUT');
      expect(delete.toUpperCase(), 'DELETE');
      expect(patch.toUpperCase(), 'PATCH');
    });
  });
}

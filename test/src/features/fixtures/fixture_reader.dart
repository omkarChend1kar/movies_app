import 'dart:io';

String fixture(String name) => File('test/src/features/fixtures/$name').readAsStringSync();

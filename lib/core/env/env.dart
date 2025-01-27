import 'package:injectable/injectable.dart';

@injectable
class Env {
  String get baseUrl => 'https://example.com';
}

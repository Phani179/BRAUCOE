import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'GEMINI_KEY', obfuscate: true)
  static final String geminiAPIKey = _Env.geminiAPIKey;
}
import 'package:win32_registry/win32_registry.dart';

class Regedit {
  static final editor =
      Registry.currentUser.createKey(r'Software\EdgeNet\buzhidao');

  static void write(
      String keyName, RegistryValueType keyType, Object keyValue) {
    editor.createValue(RegistryValue(keyName, keyType, keyValue));
  }

  static int? readInt(String keyName) {
    return editor.getValueAsInt(keyName);
  }

  static String? readString(String keyName) {
    return editor.getValueAsString(keyName);
  }
}

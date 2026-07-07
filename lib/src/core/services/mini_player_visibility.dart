import 'package:flutter/foundation.dart';

class MiniPlayerVisibility {
  MiniPlayerVisibility._();
  static final ValueNotifier<bool> isVisible = ValueNotifier<bool>(true);
  static void show() => isVisible.value = true;
  static void hide() => isVisible.value = false;
}

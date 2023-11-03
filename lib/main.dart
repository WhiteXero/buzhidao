import 'package:buzhidao/screens/init.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' as flutter_acrylic;
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await flutter_acrylic.Window.initialize();
  await flutter_acrylic.Window.hideWindowControls();
  await WindowManager.instance.ensureInitialized();
  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setTitleBarStyle(
      TitleBarStyle.hidden,
      windowButtonVisibility: false,
    );
    await windowManager.setMinimumSize(const Size(500, 600));
    await windowManager.show();
    await windowManager.setPreventClose(true);
    await windowManager.setSkipTaskbar(false);
  });
  runApp(const Init());
}

class Init extends StatelessWidget {
  const Init({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
        debugShowCheckedModeBanner: false,
        title: '不知岛',
        key: key,
        themeMode: ThemeMode.system,
        theme: FluentThemeData(brightness: Brightness.light, fontFamily: 'SC'),
        darkTheme:
            FluentThemeData(brightness: Brightness.dark, fontFamily: 'SC'),
        home: InitPage());
  }
}

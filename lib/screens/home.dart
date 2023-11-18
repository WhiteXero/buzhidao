import 'package:fluent_ui/fluent_ui.dart';

import 'package:window_manager/window_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> with WindowListener {
  int topIndex = 0;
  @override
  void initState() {
    windowManager.addListener(this);
    windowManager.startDragging();
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return NavigationView(
      appBar: const NavigationAppBar(
        leading: FlutterLogo(),
        title: Text('不知岛'),
        actions: WindowButtons(),
      ),
      pane: NavigationPane(
          items: navigationItems,
          footerItems: footerItems,
          selected: topIndex,
          onChanged: (index) {
            setState(() {
              topIndex = index;
            });
          }),
    );
  }

  late List<NavigationPaneItem> navigationItems = [
    PaneItem(
      icon: const Icon(FluentIcons.home),
      title: const Text('主页'),
      body: const Padding(
        padding: EdgeInsetsDirectional.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Card(
                  child: Align(
                      child: Text('不知岛', style: TextStyle(fontSize: 20)))),
            ],
          ),
        ),
      ),
    ),
    PaneItemSeparator(),
    PaneItem(
      icon: const Icon(FluentIcons.issue_tracking),
      title: const Text('综合线'),
      body: const Text("1"),
    ),
  ];

  List<NavigationPaneItem> footerItems = [
    PaneItem(
      icon: const Icon(FluentIcons.settings),
      title: const Text('设置'),
      body: const Text("1"),
    ),
  ];

  @override
  void onWindowClose() async {
    bool isPreventClose = await windowManager.isPreventClose();
    if (isPreventClose && mounted) {
      showDialog(
        context: context,
        builder: (_) {
          return ContentDialog(
            title: const Text('确认退出'),
            content: const Text('确认要退出不知岛吗？'),
            actions: [
              FilledButton(
                child: const Text('是的，我润了'),
                onPressed: () {
                  Navigator.pop(context);
                  windowManager.destroy();
                },
              ),
              Button(
                child: const Text('不是，手滑了'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);

    return SizedBox(
      width: 138,
      height: 50,
      child: WindowCaption(
        brightness: theme.brightness,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

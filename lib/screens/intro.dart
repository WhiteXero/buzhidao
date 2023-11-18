import 'package:fluent_ui/fluent_ui.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:win32_registry/win32_registry.dart';

import '../functions/regedit.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<StatefulWidget> createState() => _Intro();
}

class _Intro extends State<Intro> {
  late List<ContentConfig> tutorialItem;
  late int no;
  int? selected;

  @override
  void initState() {
    List bright = [
      const Text(
        '亮色模式',
        style: TextStyle(fontFamily: 'SC'),
      ),
      const Text(
        '暗色模式',
        style: TextStyle(fontFamily: 'SC'),
      ),
      const Text(
        '跟随系统',
        style: TextStyle(fontFamily: 'SC'),
      ),
    ];
    tutorialItem = [
      const ContentConfig(
        title: '欢迎使用不知岛！',
        description: '接下来将进行一些基本设置',
        styleTitle: TextStyle(
            fontFamily: 'SC', fontSize: 36, fontWeight: FontWeight.bold),
        styleDescription: TextStyle(fontFamily: 'SC', fontSize: 24),
      ),
      ContentConfig(
          title: '选择主题',
          description: '配置不知岛的亮暗主题',
          styleTitle: const TextStyle(
              fontFamily: 'SC', fontSize: 36, fontWeight: FontWeight.bold),
          styleDescription: const TextStyle(fontFamily: 'SC', fontSize: 24),
          centerWidget: Button(
            child: const Text('选择主题'),
            onPressed: () => showDialog(
                context: context,
                builder: (context) => ContentDialog(
                      title: const Text('选择主题'),
                      content: const Text('请注意：跟随系统仅跟随Windows系统色调设置。'),
                      actions: List.generate(3, (index) {
                        return Button(
                            child: bright[index],
                            onPressed: () {
                              Regedit.write('Brightness',
                                  RegistryValueType.string, index.toString());
                              displayInfoBar(context,
                                  builder: (context, close) {
                                return InfoBar(
                                  title: const Text('设置成功'),
                                  content: bright[index],
                                  action: IconButton(
                                    icon: const Icon(FluentIcons.clear),
                                    onPressed: close,
                                  ),
                                  severity: InfoBarSeverity.success,
                                );
                              });
                              Navigator.pop(context);
                            });
                      }),
                    )),
          ))
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xFFBC95C6), Color(0xFF7DC4CC)])),
        child: IntroSlider(
          key: UniqueKey(),
          listContentConfig: tutorialItem,
          renderNextBtn: const Text(
            '继续',
            style: TextStyle(color: Colors.white),
          ),
          renderDoneBtn: const Text(
            '完成',
            style: TextStyle(color: Colors.white),
          ),
          renderPrevBtn: const Text(
            '返回',
            style: TextStyle(color: Colors.white),
          ),
          isShowSkipBtn: false,
          isAutoScroll: false,
          isLoopAutoScroll: false,
          isScrollable: false,
          onDonePress: () => debugPrint('Tutorial Done'),
        ));
  }
}

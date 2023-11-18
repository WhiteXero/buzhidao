import 'package:fluent_ui/fluent_ui.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:go_router/go_router.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({super.key});

  @override
  State<StatefulWidget> createState() => _Tutorial();
}

class _Tutorial extends State<Tutorial> {
  final bgm = AudioPlayer();
  bool visible = false;

  @override
  void initState() {
    bgm.setReleaseMode(ReleaseMode.loop);
    bgm.play(AssetSource('tutorial_music.mp3'), volume: 0.01);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startTutorial();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedOpacity(
                opacity: visible ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: const Text(
                  "嗨！",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                )),
            AnimatedOpacity(
                opacity: visible ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: const Text(
                  "不知岛正在初始化数据",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }

  void startTutorial() {
    bool listen = true;
    setState(() {
      visible = !visible;
    });
    bgm.onPositionChanged.listen((Duration p) {
      if (p.inSeconds == 9 && listen) {
        listen = !listen;
        setState(() {
          visible = !visible;
        });
        context.goNamed('intro');
      }
    });
  }
}

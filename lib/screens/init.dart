import 'package:fluent_ui/fluent_ui.dart';

import 'home.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  final String state = "初始化程序";

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    loadProgram(context);
    return ScaffoldPage(
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "不知岛",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Text(state),
                const ProgressBar(),
              ],
            )
          ],
        ),
      ),
    );
  }

  void loadProgram(BuildContext context) async {
    if (context.mounted) {
      await Future.delayed(const Duration(seconds: 3));
      WidgetsBinding.instance.addPostFrameCallback((_) {
        debugPrint('不知岛 已启动');
        Navigator.pushAndRemoveUntil(context, FluentPageRoute(builder: (builder) => const HomePage()), (route) => false);
      });
    }
  }
}

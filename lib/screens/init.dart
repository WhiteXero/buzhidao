import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

import '../functions/regedit.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3), () {
          return;
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (Regedit.readInt('FirstRun') != 1) {
                context.goNamed('tutorial');
              }
            });
          }
          return const ScaffoldPage(
            content: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "不知岛",
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      ProgressBar(),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

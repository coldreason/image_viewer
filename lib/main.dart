import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:imageViewer/domain/use_case/manage_image_info_use_case.dart';
import 'package:imageViewer/firebase_options.dart';
import 'package:provider/provider.dart';

import 'app_logger.dart';
import 'domain/di.dart';
import 'presentation/manage_image/manage_image_info_page.dart';
import 'presentation/manage_image/manage_image_info_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppLogger.initLogger();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (defaultTargetPlatform != TargetPlatform.windows) {
    final emulatorHost =
        (!kIsWeb && defaultTargetPlatform == TargetPlatform.android)
            ? '10.0.2.2'
            : 'localhost';

    await FirebaseStorage.instance.useStorageEmulator(emulatorHost, 9199);
  }
  dependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => ManageImageInfoViewModel(
                  manageImageInfoUseCase: getIt<ManageImageInfoUseCase>())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  int _currnetPage = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image System'),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: const [
                  Scaffold(
                    body: Center(
                      child: Text('id: userId'),
                    ),
                  ),
                  ManageImageInfoPage(),
                ],
              ),
            ),
            BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              currentIndex: _currnetPage,
              backgroundColor: Colors.white,
              unselectedItemColor: const Color(0xFFA8A8A8),
              selectedItemColor: const Color(0xFF0056FF),
              selectedFontSize: 11,
              unselectedFontSize: 11,
              unselectedLabelStyle: const TextStyle(
                  color: Color(0xFFA8A8A8), fontWeight: FontWeight.w600),
              selectedLabelStyle: const TextStyle(
                  color: Color(0xFF0056FF), fontWeight: FontWeight.w600),
              onTap: (int index) async {
                pageController.jumpToPage(index);
                setState(() {
                  _currnetPage = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.access_time_filled,
                      color: _currnetPage == 0
                          ? const Color(0xFF0056FF)
                          : const Color(0xFFCCCCCC),
                      size: 26,
                    ),
                    label: "account"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.access_time_filled,
                      color: _currnetPage == 1
                          ? const Color(0xFF0056FF)
                          : const Color(0xFFCCCCCC),
                      size: 26,
                    ),
                    label: "image"),
              ],
            )
          ],
        ));
  }
}

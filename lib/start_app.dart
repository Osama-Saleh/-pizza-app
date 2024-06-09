part of './utils/import_paths/import_paths.dart';

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    var loginController = Provider.of<LoginController>(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Pizza Delivery',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.light(
            background: Colors.grey.shade100,
            onBackground: Colors.black,
            primary: Colors.blue,
            onPrimary: Colors.white,
          )),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          // home: isHaveUser ? const HomeScreen() : const WelcomeView(),
          home: Wrapper(),
          // home: StreamBuilder(
          //   stream: loginController.userState(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //     return snapshot.hasData
          //         ? const HomeScreen()
          //         : const WelcomeView();
          //   },
          // ),
        );
      },
    );
  }
}

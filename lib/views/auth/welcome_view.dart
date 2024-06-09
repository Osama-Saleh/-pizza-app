part of '../../utils/import_paths/import_paths.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView>
    with TickerProviderStateMixin {
  late TabController tapController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tapController = TabController(
        length: 2,
        vsync: this,
        animationDuration: const Duration(milliseconds: 1500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Align(
            // alignment: const AlignmentDirectional(0, -1.2),
            child: Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.tertiary),
            ),
          ),
          Align(
            // alignment: const AlignmentDirectional(0, -1.2),
            child: Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width / 1.3,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(),
          ),
          Align(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: TabBar(
                    controller: tapController,
                    labelColor: Colors.black,
                    tabs: const [
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: TabBarView(controller: tapController, children: [
                    // ,
                    
                    LogInView(),
                    SingUpView(),
                  ]),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

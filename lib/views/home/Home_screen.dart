part of '../../utils/import_paths/import_paths.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeController = Provider.of<HomeController>(context);
    var langController = Provider.of<ControllerLanguages>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            Image.asset(
              'assets/8.png',
              scale: 10.sp,
            ),
            SizedBox(
              width: 10.h,
            ),
            Text(
              'PIZZA',
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900),
            ),
          ],
        ),
        actions: [
          LangUI(),
          Container(
            child: IconButton(
              onPressed: () {
                homeController.getPizza();
              },
              icon: const Icon(Icons.language)),
          ),
          IconButton(
              onPressed: () {
                homeController.getPizza();
              },
              icon: const Icon(Icons.cabin)),
          IconButton(
              onPressed: () => homeController.logOut(),
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: FutureBuilder(
          future: homeController.getPizza(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 5,
                ),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return snapshot.data?.length==0 ?Center(child: Text('No Date')) : Material(
                    color: Colors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(10.r),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DatailsScreen(index: index,
                              dataPizza: snapshot.data?[index],
                              ),
                            ));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                                tag: 'image$index',
                                transitionOnUserGestures: true,
                                child: Image(
                                  image: NetworkImage(
                                      snapshot.data?[index].picture ?? ''),
                                      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                                        
                                        return frame ==null ? Center(child: CircularProgressIndicator()): child;
                                      },
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    

                                    if (loadingProgress == null) return child;
                                    return Center(child: CircularProgressIndicator());
                                  },
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.sp, horizontal: 10.sp),
                                  child: Text(
                                    snapshot.data?[index].isVeg == true
                                        ? 'VEG'
                                        : 'NON-VEG',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.3),
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.sp, horizontal: 10.sp),
                                  child: Text(
                                    '🔥 BALANCE',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${snapshot.data?[index].name}',
                              style: TextStyle(
                                  // color: Colors.green,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              '${snapshot.data?[index].description}',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 10.sp,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '\$${snapshot.data?[index].price}',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  '\$${snapshot.data?[index].discount}',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.black,
                                      decorationThickness: 2.sp),
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.add_circle))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

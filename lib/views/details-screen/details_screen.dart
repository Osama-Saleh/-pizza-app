part of '../../utils/import_paths/import_paths.dart';

class DatailsScreen extends StatelessWidget {
  final int index;
  final PezzaModel? dataPizza;
  const DatailsScreen({super.key, required this.index, this.dataPizza});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            children: [
              Hero(
                tag: 'image$index',
                transitionOnUserGestures: true,
                child: Container(
                  width: 1.sw,
                  height: 0.5.sh,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.r,
                        // spreadRadius: -5,
                        offset: Offset(1.r, 1.r),
                      ),
                    ],

                    // image: DecorationImage(
                    //   image: AssetImage('assets/1.png'),
                    // ),
                  ),
                  child: Image(
                    image: NetworkImage(dataPizza?.picture ?? ''),
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      return frame == null
                          ? Center(child: CircularProgressIndicator())
                          : child;
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 3.r,
                      // spreadRadius: -5,
                      offset: Offset(0.r, 1.r),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            '${dataPizza?.description}',
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: [
                                Text(
                                  '\$${dataPizza?.price}',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                Text(
                                  '\$${dataPizza?.discount}',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        CardDetails(
                          value: dataPizza?.macros?.calorirs ?? 0,
                          title: 'Calories',
                          icon: FontAwesomeIcons.fire,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CardDetails(
                          value: dataPizza?.macros?.protiens ?? 0,
                          title: 'Protein',
                          icon: FontAwesomeIcons.dumbbell,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CardDetails(
                          value: dataPizza?.macros?.fat ?? 0,
                          title: 'fat',
                          icon: FontAwesomeIcons.oilWell,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CardDetails(
                          value: dataPizza?.macros?.carbs ?? 0,
                          title: 'Carbs',
                          icon: FontAwesomeIcons.breadSlice,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextButton(
                      buttonText: 'Buy Now',
                      backgroundColor: Colors.black,
                      testStyle: TextStyle(color: Colors.white),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

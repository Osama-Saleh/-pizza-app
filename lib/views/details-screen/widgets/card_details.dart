part of '../../../utils/import_paths/import_paths.dart';

class CardDetails extends StatelessWidget {
  final String title;
  final int value;
  final IconData icon;
  const CardDetails(
      {super.key,
      required this.title,
      required this.value,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10.r,
              spreadRadius: -5,
              offset: Offset(2.r, 2.r),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(
                icon,
                size: 30.sp,
                color: Colors.red,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                title == 'Calories' ? '$value $title' : '${value}g $title',
                style: TextStyle(
                  fontSize: 8.sp,
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

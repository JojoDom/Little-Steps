import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class BottomAppBarWidget extends StatefulWidget {
  const BottomAppBarWidget({Key? key, required this.controller})
      : super(key: key);
  final DashboardController controller;

  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 4,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Container(
        color: const Color.fromARGB(255, 226, 203, 203),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildAppBarItem(
                index: 0,
                title: "Home",
                icon: Icon(Icons.home,color: Colors.grey,size: 30,),
                iconActive:  Icon(Icons.home,color: Colors.red, size: 30,)),
                const SizedBox(
              width: 55,
            ),
            buildAppBarItem(
                index: 1,
                title: "Students",
                icon: Icon(Icons.person,color: Colors.grey,),
                iconActive: Icon(Icons.person,color: Colors.red,)),
            
          ],
        ),
      ),
    );
  }

  Widget buildAppBarItem(
      {required int index,
      required String title,
      required Icon icon,
      required Icon iconActive}) {
    return InkWell(
      onTap: () {
        widget.controller.onChangedAppBar(index);
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        height: 80,
        width: 80,
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => 
                      widget.controller.currentIndex.value == index
                          ? iconActive
                          : icon,
                    ),
                const SizedBox(height: 8),
                Obx(
                  () => Text(
                    title,
                    // maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: widget.controller.currentIndex.value == index
                            ? Colors.white
                            : Colors.grey),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

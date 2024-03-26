import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:little_steps/controllers/students_controller.dart';
import 'package:little_steps/screens/home/model/school_actions_modal.dart';
import 'package:little_steps/widgets/school_actions.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  void initState() {
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 226, 203, 203),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Little Steps',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: 
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: const BoxDecoration(
            //  color: const Color.fromARGB(255, 226, 203, 203),
          ),
          child: GridView.builder(
             shrinkWrap: true,
                 scrollDirection: Axis.vertical,
                 itemCount: actionsList.length,
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   mainAxisExtent: 150,
                   mainAxisSpacing: 10,
                   crossAxisSpacing: 10,
                 ),
          itemBuilder: ((context, index)=>SchoolActions( schoolActions: actionsList[index]))
          ),
        ),
     
    );
  }
}

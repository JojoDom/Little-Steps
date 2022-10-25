import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:little_steps/widgets/custom_button.dart';

class CheckInOrOutForm extends StatefulWidget {
  const CheckInOrOutForm({Key? key}) : super(key: key);

  @override
  State<CheckInOrOutForm> createState() => _CheckInOrOutFormState();
}

class _CheckInOrOutFormState extends State<CheckInOrOutForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black,)),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(
                    height: 150,
                    child: SvgPicture.asset('assets/svgs/little_steps_icon.svg')),
              const SizedBox(height: 80,),
              TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Student ID'),
                      contentPadding:  EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.vertical())
                          ),
                ),
                 const SizedBox(height: 20,),
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Guardian Name'),
                      contentPadding:  EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.vertical())
                          ),
                ),
                 const SizedBox(height: 20,),
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Guardian Contact'),
                      contentPadding:  EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.vertical())
                          ),
                ),
              const SizedBox(height: 30),
              CustomButton(
            buttonText: 'DONE',
            textColor: Colors.white,
            onTap: () {
            },
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFFE2202C), Color(0xFFE7979C)]),
            isBusy: false)

              ],
            ),
          ),
        ),
      ),
    );
  }
}

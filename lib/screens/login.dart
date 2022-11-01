import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:little_steps/controllers/login_controller.dart';
import 'package:little_steps/screens/dashboard/dashboard.dart';
import 'package:little_steps/widgets/custom_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    child:
                        SvgPicture.asset('assets/svgs/little_steps_icon.svg')),
                Center(
                    child: Text(
                  'ADMIN PORTAL',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color(0xFF3E1097),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  autofocus: false,
                  controller: loginController.userNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      hintText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autofocus: false,
                  controller: loginController.passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Obx(() => CustomButton(
            buttonText: 'Login',
            textColor: Colors.white,
            onTap: () async {            
              if(_formKey.currentState!.validate()){
                await loginController.login(
                  userName: loginController.userNameController.text,
                  password: loginController.passwordController.text);
                   Get.offAll(const DashBoard());

              }
            },
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFFE2202C), Color(0xFFE7979C)]),
            isBusy: loginController.isLoggedIn.value)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
       backgroundColor: Colors.white, 
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: MediaQuery.of(context).size.height*0.4,
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset('assets/svgs/little_steps_icon.svg')),
              Center(child: Text('ADMIN PORTAL',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: const Color(0xFF3E1097),
                fontSize: 15, fontWeight: FontWeight.bold
              ),
              ))
          ],
        ),
      ),
    );
  }
}

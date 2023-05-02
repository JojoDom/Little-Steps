import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';

import '../../../models/teachers_list.dart';
import 'package:url_launcher/url_launcher.dart';

class TeachersDetails extends StatelessWidget {
  const TeachersDetails({Key? key, required this.teacher}) : super(key: key);

  final Teacher teacher;

  @override
  Widget build(BuildContext context) {
    launchPhoneUrl() async {
      final url = Uri(scheme: 'tel', path: teacher.phone);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch ';
      }
    }

    launchMail() async {
      final url = Uri(scheme: 'mailto', path: teacher.email);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch ';
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: (() => Get.back()),
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.red,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          //  crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: ProfilePicture(
                name: '${teacher.firstName} ${teacher.lastName}',
                fontsize: 20,
                radius: 40,
                count: 2,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text('${teacher.firstName}  ${teacher.lastName}',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .1),
            Text(
              'Email',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.red, height: 0.8),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(teacher.email),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Phone Number',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.red, height: 0.8),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(teacher.phone ?? ''),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Actions',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                launchPhoneUrl();
              },
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: const Color(0XFFFFD7D7),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Icon(
                        Icons.phone,
                        color: Color(0XFFFF1818),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text('Call ${teacher.firstName}')
                ],
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                launchMail();
              },
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: const Color(0XFFFFD7D7),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Icon(
                        Icons.mail,
                        color: Color(0XFFFF1818),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text('Send ${teacher.firstName} an email')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

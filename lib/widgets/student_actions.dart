import 'package:flutter/material.dart';

class StudentActions extends StatelessWidget {
  const StudentActions({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final Icon icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(       
        width: MediaQuery.of(context).size.width*0.5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: const Color.fromARGB(255, 226, 203, 203),
            elevation: 0,
            child: ListTile(
              leading: const Icon(Icons.qr_code_2),
              title: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),)
           
          ),
        ),
      ),
    );
  }
}

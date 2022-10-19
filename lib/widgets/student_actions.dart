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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const SizedBox(height: 50,),
               const Icon(Icons.qr_code,size: 100, color: Colors.blueGrey,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      text,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

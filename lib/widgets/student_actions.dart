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
        height: 100,
        width: 200,
        child: Card(
          color: const Color.fromARGB(255, 226, 203, 203),
          child: Center(
            child: ListTile(
              leading: icon,
              title: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

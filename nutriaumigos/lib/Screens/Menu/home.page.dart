import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 152, 158, 0.73),
      body: Container(
        height: 125,
        margin: const EdgeInsets.symmetric(vertical: 60.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            buildCard(
                context, 'Nutricionista', 'assets/icons/patinhaColor_icon.png'),
            const SizedBox(width: 12),
            buildCard(context, 'Pet', 'assets/icons/patinha_icon.png'),
            const SizedBox(width: 12),
            buildCard(context, 'Alimentos', 'assets/icons/patinha_icon.png'),
            const SizedBox(width: 12),
            buildCard(context, 'FeedBack', 'assets/icons/patinha_icon.png'),
          ],
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String name, String imageButton) =>
      SizedBox(
        width: 100,
        height: 100,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () =>
                    {Navigator.pushReplacementNamed(context, 'menuPrincipal')},
                child: Container(
                  width: 74,
                  height: 74,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(239, 239, 239, 1),
                    border: Border.all(
                        color: const Color.fromRGBO(239, 239, 239, 1),
                        width: 3.0), // Set border width
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10.0)), // Set rounded corner radius
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(imageButton, height: 37, width: 37),
                  ),
                ),
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(196, 196, 196, 1),
                  fontSize: 16),
            )
          ],
        ),
      );
}

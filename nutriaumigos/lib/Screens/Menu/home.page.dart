import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< Updated upstream
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: SizedBox(
            width: 100,
            child: Image.asset("assets/images/Logo.png"),
          ),
        ),
        leading: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Logo.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: 60,
            child: TextButton(
              child: const Icon(
                Icons.search,
                color: Color(0xFFBABABA),
              ),
              onPressed: () => {},
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFF2F3F6),
        child: ListView(
          children: <Widget>[
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
          ],
        ),
      ),
    );
=======
        backgroundColor: const Color.fromRGBO(3, 152, 158, 0.73),
        body: Container(
            height: 125,
            margin: const EdgeInsets.symmetric(vertical: 60.0),
            child: ListView(scrollDirection: Axis.horizontal, children: [
              buildCard(context, 'Nutricionista',
                  'assets/icons/patinhaColor_icon.png'),
              const SizedBox(width: 12),
              buildCard(context, 'Pet', 'assets/icons/patinha_icon.png'),
              const SizedBox(width: 12),
              buildCard(context, 'Alimentos', 'assets/icons/patinha_icon.png'),
              const SizedBox(width: 12),
              buildCard(context, 'FeedBack', 'assets/icons/patinha_icon.png'),
            ])));
>>>>>>> Stashed changes
  }

<<<<<<< Updated upstream
Widget cardItem() {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: CircleAvatar(),
          title: Text("Bruce Wayne"),
          subtitle: Text("09/05/2019 18:37"),
          trailing: Icon(Icons.more_vert),
        ),
        Image.asset("assets/images/Logo.png"),
        Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis ex sem. Praesent elit dui, iaculis at interdum eu, rutrum et mi. "),
        ),
        // ButtonTheme.bar(
        //   child: ButtonBar(
        //     children: <Widget>[
        //       TextButton(
        //         child: Icon(Icons.favorite),
        //         onPressed: () {},
        //       ),
        //       TextButton(
        //         child: Icon(Icons.share),
        //         onPressed: () {},
        //       ),
        //     ],
        //   ),
        // ),
      ],
    ),
  );
=======
  Widget buildCard(BuildContext context, String name, String imageButton) =>
      SizedBox(
          width: 100,
          height: 100,
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.pushReplacementNamed(context, 'menuPrincipal')
                    },
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
                  )),
              Text(name,
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(196, 196, 196, 1),
                      fontSize: 16))
            ],
          ));
>>>>>>> Stashed changes
}

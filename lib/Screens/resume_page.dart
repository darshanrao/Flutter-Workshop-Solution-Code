import 'package:flutter/material.dart';

class ResumePage extends StatelessWidget {
  final String name;
  final String email;
  final String desc;
  ResumePage({required this.name, required this.email, required this.desc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
            child: Card(
              color: const Color(0xFF424242),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage("images/pfp.png"),
                          radius: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text(
                            email,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            desc,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class name_and_balance extends StatelessWidget {
  const name_and_balance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                      text: "Good Morning,",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w300)),
                  TextSpan(
                      text: "\nAlper",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.w400)),
                ]),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(
                          text: "CURRENT BALANCE",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "\n2,532.67",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 225, 0),
                              fontSize: 30,
                              fontWeight: FontWeight.w400))
                    ],
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Text("USD",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 225, 0),
                                fontSize: 17,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.only(top: 22),
                    onPressed: () {},
                    icon: Icon(Icons.expand_more_rounded),
                    color: Colors.black45,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

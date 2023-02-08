import 'package:flutter/material.dart';
import 'package:test/widgets/status_card.dart';

class tab_buttons extends StatelessWidget {
  const tab_buttons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Expanded(
        child: Column(
          children: [
            Material(
              color: Colors.white,
              child: TabBar(
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
                labelColor: Colors.black,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.grey.shade500,
                indicatorWeight: 1,
                indicatorColor: Color.fromARGB(255, 255, 225, 0),
                tabs: [
                  Tab(
                    text: "Statement",
                  ),
                  Tab(
                    text: "Spends",
                  ),
                  Tab(
                    text: "Income",
                  ),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
              children: [status_card(), Container(), Container()],
            ))
          ],
        ),
      ),
    );
  }
}

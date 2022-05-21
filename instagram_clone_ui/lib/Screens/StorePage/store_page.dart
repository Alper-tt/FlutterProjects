import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_ui/widgets/store/shop_page_button.dart';

import '../../widgets/SearchBar/search_bar.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SvgPicture.asset(
            "assets/bookmark.svg",
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Shop",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SearchBar(title: "Search shops",),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      ShopPageButton(text: "Shops"),
                      ShopPageButton(text: "Videos"),
                      ShopPageButton(text: "Editors' picks"),
                      ShopPageButton(text: "Collections"),
                      ShopPageButton(text: "Guides"),
                    ],
                  ),
                ),
              ),
            ),
            GridView.builder(
              itemCount: 8,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 4,
                    childAspectRatio: 1),
                itemBuilder: (_, index) {
                  return GridTile(
                      child: Image.asset(
                    "assets/store_page_content/store_${index + 1}.png",
                    fit: BoxFit.cover,
                  ));
                })
          ],
        ),
      ),
    );
  }
}


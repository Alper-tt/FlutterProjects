import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_ui/widgets/store/shop_page_button.dart';

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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: CupertinoTextField(
                placeholder: "Search shops",
                placeholderStyle: TextStyle(color: Colors.grey.shade600),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
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

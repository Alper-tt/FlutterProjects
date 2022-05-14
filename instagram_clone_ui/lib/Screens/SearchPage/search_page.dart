import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              toolbarHeight: 60,
              elevation: 0,
              backgroundColor: Colors.white,
              bottom: PreferredSize(
                  child: Text(''), preferredSize: Size.fromHeight(10)),
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10)),
                child: CupertinoSearchTextField(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            SliverToBoxAdapter(
              
              child: GridView.custom(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: [
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(2, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                    ]),
                childrenDelegate: SliverChildBuilderDelegate(
                    ((context, index) => Container(
                          child: Image.asset(
                            "assets/search_page_contents/h_${index + 1}.png",
                            fit: BoxFit.cover,
                          ),
                        )),
                    childCount: 19),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

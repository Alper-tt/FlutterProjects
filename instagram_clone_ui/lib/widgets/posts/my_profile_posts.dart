import 'package:flutter/material.dart';

class MyProfilePosts extends StatelessWidget {
  const MyProfilePosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        
        
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 4,
          childAspectRatio: 1),
      itemBuilder: (context, index) {
        
        return GridTile(
            child: Image.asset("assets/my_posts/post_${index + 1}.png"));
      },
    );
  }
}

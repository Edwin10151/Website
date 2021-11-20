import 'package:blog/about_section.dart';
import 'package:blog/recent_blog.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'hobby_section.dart';
import 'top_section.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:  [
            TopSection(),
            AboutSection(),
            SizedBox(height: kDefaultPadding * 2),
            HobbySection(),
          RecentBlogSection(),
            
          ],
        ),
      ),
    );
  }
}

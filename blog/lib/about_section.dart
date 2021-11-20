import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  _launchURL() async {
    const url = 'https://www.linkedin.com/in/edwin-ting-07a936215/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL2() async {
    const url = 'https://github.com/Edwin10151';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AboutTextWithSign(),
              Expanded(
                child: AboutSectionText(
                  text: "Hi, my name is Edwin, 17 years old",
                ),
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding * 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding,
                  horizontal: kDefaultPadding * 2,
                ),
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  label: const Text(""),
                  icon: Image.asset(
                    'assets/linkedin.png',
                    height: 40,
                  ),
                  onPressed: () {
                    _launchURL();
                  },
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding,
                    horizontal: kDefaultPadding * 2,
                  ),
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    label: const Text(""),
                    icon: Image.asset(
                      'assets/github.png',
                      height: 40,
                    ),
                    onPressed: () {
                      _launchURL2();
                    },
                  )),

              // MyOutlineButton(
              //   imageSrc: "assets/images/hand.png",
              //   text: "Hire Me!",
              //   press: _launchURL(),
              // ),
              // SizedBox(width: kDefaultPadding * 1.5),
              // DefaultButton(
              //   imageSrc: "assets/images/download.png",
              //   text: "Download CV",
              //   press: _launchURL2(),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

class AboutSectionText extends StatelessWidget {
  const AboutSectionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w200, color: kTextColor, height: 2),
      ),
    );
  }
}

class AboutTextWithSign extends StatelessWidget {
  const AboutTextWithSign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About \nmee",
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }
}

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    Key? key,
    required this.numOfExp,
  }) : super(key: key);

  final String numOfExp;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      height: 240,
      width: 255,
      decoration: BoxDecoration(
        color: Color(0xFFF7E8FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFFEDD2FC),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 6,
              color: Color(0xFFA600FF).withOpacity(0.25),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Text(
                  numOfExp,
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Color(0xFFDFA3FF).withOpacity(0.5),
                    shadows: [
                      BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 10,
                        color: Color(0xFFA600FF).withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                Text(
                  numOfExp,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 100,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(height: kDefaultPadding / 2),
            Text(
              "Years of Experience",
              style: TextStyle(
                color: Color(0xFFA600FF),
              ),
            )
          ],
        ),
      ),
    );
  }
}



// class MyOutlineButton extends StatelessWidget {
//   const MyOutlineButton({
//     Key? key,
//     required this.imageSrc,
//     required this.text,
//     required this.press,
//   }) : super(key: key);

//   final String imageSrc, text;
//   final Function press;

//   @override
//   Widget build(BuildContext context) {
//     return FittedBox(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           vertical: kDefaultPadding,
//           horizontal: kDefaultPadding * 2.5,
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(50),
//           ),
//           child: OutlinedButton(
//             borderSide: BorderSide(color: Color(0xFFEDEDED)),
//             onPressed: press,
//             child: Row(
//               children: [
//                 Image.asset(
//                   imageSrc,
//                   height: 40,
//                 ),
//                 SizedBox(width: kDefaultPadding),
//                 Text(text)
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

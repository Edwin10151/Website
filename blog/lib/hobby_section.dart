import 'package:blog/section_tile.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

import 'package:flutter/material.dart';

class Service {
  final int id;
  final String title, image;
  final Color color;

  Service(
      {required this.id,
      required this.title,
      required this.image,
      required this.color});
}

// For demo list of service
List<Service> services = [
  Service(
    id: 1,
    title: "Software Development",
    image: "assets/graphic.png",
    color: Color(0xFFD9FFFC),
  ),
  Service(
    id: 2,
    title: "Artificial Intelligence",
    image: "assets/desktop.png",
    color: Color(0xFFE4FFC7),
  ),
  Service(
    id: 3,
    title: "Exploring..",
    image: "assets/Intreaction_design.png",
    color: Color(0xFFFFF3DD),
  ),
  Service(
    id: 4,
    title: "Exploring..",
    image: "assets/Intreaction_design.png",
    color: Color(0xFFFFE0E0),
  ),
];

class HobbySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
            color: Color(0xFFFF0000),
            title: "My Hobbiees",
            subTitle: "My Strong Arenas",
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          Wrap(
            spacing: kDefaultPadding,
            runSpacing: kDefaultPadding * 2,
            children: List.generate(
                services.length, (index) => ServiceCard(index: index)),
          )
        ],
      ),
    );
  }
}

class ServiceCard extends StatefulWidget {
  const ServiceCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isHover = false;
  Duration duration = Duration(milliseconds: 200);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      hoverColor: Colors.transparent,
      child: AnimatedContainer(
        duration: duration,
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
        height: 256,
        width: 256,
        decoration: BoxDecoration(
          color: services[widget.index].color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover) kDefaultCardShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: duration,
              padding: EdgeInsets.all(kDefaultPadding * 1.5),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  if (!isHover)
                    BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 30,
                      color: Colors.black.withOpacity(0.1),
                    ),
                ],
              ),
              child: Image.asset(
                services[widget.index].image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: kDefaultPadding),
            Text(
              services[widget.index].title,
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}

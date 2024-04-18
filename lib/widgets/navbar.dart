import 'package:flutter/material.dart';
import 'package:greenbay_web/pages/events.dart';
import 'package:greenbay_web/pages/forum.dart';
import 'package:greenbay_web/pages/landing.dart';
import 'package:greenbay_web/pages/projects.dart';
import 'package:greenbay_web/widgets/text.dart';


class HomepageNavbar extends StatelessWidget implements PreferredSizeWidget {

  final String logo = "../assets/images/greenbay_logo.png";

  @override
  Size get preferredSize => const Size.fromHeight(60);


  const HomepageNavbar({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Landing(),
            ),
          );
        },
        child: Image.asset(
          logo,
          width: 200,
          height: 200,
        ),
      ),
      actions: [
        TextButton(
          child: const SubHeading(
            text: "Events",
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Events(),
              ),
            );
          },
        ),
        TextButton(
          child: const SubHeading(
            text: "Projects",
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Projects(),
              ),
            );
          },
        ),
        TextButton(
          child: const SubHeading(
            text: "Forum",
            color: Colors.white,
        ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Forum(),
              ),
            );
          },
        ),
      ],
      backgroundColor: const Color.fromARGB(255, 3, 71, 96)
    );
  }

}


class NavbarWithOnlyLogo extends StatelessWidget implements PreferredSizeWidget {

  final String logo = "../assets/images/greenbay_logo.png";

  @override
  Size get preferredSize => const Size.fromHeight(60);

  const NavbarWithOnlyLogo({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: GestureDetector(
        child: Image.asset(
          logo,
          width: 200,
          height: 200,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Landing(),
            ),
          );
        },
      ),
      actions: const [
        
      ],
      backgroundColor: const Color.fromARGB(255, 3, 71, 96)
    );
  }

}
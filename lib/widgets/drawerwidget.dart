
import 'package:find_me/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  void initState() {
    super.initState();
    /*SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersive); // tna7i barre mta3 wa9t wel buttons mel louta*/
  }

  @override
  void dispose() {
    /*SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);*/
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero
          ),
      width: MediaQuery.of(context).size.width * 0.75,
      backgroundColor: const Color(0xFFFDF1E1),
      child: ListView(children: <Widget>[
        
        buildHeader(context),
        const Divider(thickness: 0.5,color: Color(0xFF965D1A),),
        ListTile(
          onTap: () {
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => MainScreenPage(),), (route) => false);
          } ,
          leading: const Icon(
            CupertinoIcons.home,
            color: Colors.black,
          ),
          title: const Text(
            "Home Page",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
          ),
        ),
        ListTile(
          onTap: () {} ,
          leading: const Icon(
            CupertinoIcons.person_circle,
            color: Colors.black,
          ),
          title: const Text(
            "My Profile",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
          ),
        ),
        ListTile(
          onTap: () {} ,
          leading: const Icon(
            CupertinoIcons.bell,
            color: Colors.black,
          ),
          title: const Text(
            "Notifications",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
          ),
        ),
         ListTile(
          onTap: () {},
          leading: const Icon(
            CupertinoIcons.heart,
            color: Colors.black,
          ),
          title: const Text(
            "Favorites",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
          ),
        ),
        ListTile(
          onTap: () {} ,
          leading: const Icon(
            CupertinoIcons.cart,
            color: Colors.black,
          ),
          title: const Text(
            "Nearest shops",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            CupertinoIcons.collections,
            color: Colors.black,
          ),
          title: const Text(
            "Categories",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            CupertinoIcons.tags,
            color: Colors.black,
          ),
          title: const Text(
            "Promotions",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
          ),
        ),
        const SizedBox(
          height: 200,
        ),
        
      ]),
    );
  }

  Widget buildHeader(BuildContext context) => Material(
        color: const Color(0xFFFDF1E1),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            padding: const EdgeInsets.only(bottom: 24,),
            child: Column(children: [
              CircleAvatar(
                radius: 50,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile2.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Khadija Bensaad',
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 9,
              ),
              const Text(
                'Khadijabensaad4@gmail.com',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  color: Colors.black,
                ),
              ),
            ]),
          ),
        ),
      );
}

import 'package:citi_smart/constants.dart';
import 'package:flutter/material.dart';
import 'package:citi_smart/pages/login.dart';
import 'package:citi_smart/pages/signup_page.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
              'assets/images/Green Simple Eco Energy Logo1.png'), // Make sure to add your logo image in assets
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text('Login'),
            style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupPage()),
              );
            },
            child: Text('Signup'),
            style: ElevatedButton.styleFrom(backgroundColor: kPrimaryLightColor),
          ),
        ],
      ),
    );
  }
}

// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Background(size: size);
//   }
// }

// class Background extends StatelessWidget {
//   const Background({
//     Key? key,
//     required this.size,
//   }) : super(key: key);

//   final Size size;

//   @override
//   Widget build(BuildContext context) {
//     // Size size = MediaQuery.of(context).size; //screen size
//     return Container(
//         height: size.height,
//         width: double.infinity,
//         child: Stack(
//           children: <Widget>[
//             Positioned(
//               top: 0,
//               left: 0,
//               child: Image.asset(
//                 "assets/images/main_top.png",
//                 width: size.width * 0.3,
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               child: Image.asset(
//                 "assets/images/main_bottom.png",
//                 width: size.width * 0.2,
//               ),
//             )
//           ],
//         ));
//   }
// }




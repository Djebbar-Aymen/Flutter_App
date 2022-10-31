import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'widgets/Tweets.dart';

class Splash extends StatelessWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children :[
         Image.asset("assets/images/splash_screen.png",height: 100,width: 100,),
         Text("Share Thoughts",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
         
         ]),
      backgroundColor: Colors.cyan ,
      nextScreen: Tweets(),
      splashIconSize: 150,
      duration: 3000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds:2),
      
    );
  }
}
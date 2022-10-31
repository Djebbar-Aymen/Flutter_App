import 'package:flutter/material.dart';
import './Tweets.dart';
import '../models/Tweet.dart';
import 'package:intl/intl.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';

class Details extends StatefulWidget {
  @override

  State<Details> createState(

  ) => DetailsState();
}
class DetailsState extends State<Details> {
  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
   late Tweet tweettt;
   late Tweet tweet=ModalRoute.of(context)!.settings.arguments as Tweet;
   late VoiceController voiceController;
   @override
  void initState() {
    voiceController = FlutterTextToSpeech.instance.voiceController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    voiceController.stop();
  }

  playVoice() {
    voiceController.init().then((_) {
      voiceController.speak(
        tweet.post,
        VoiceControllerOptions(),
      );
    });
  }

  stopVoice() {
    voiceController.stop();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.lightBlue,
         title: Text('Profile',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
         actions: [IconButton(onPressed:(() => Navigator.pop(context)), icon:const Icon(Icons.home))],


      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                  CircleAvatar(backgroundImage: AssetImage("assets/images/download (2).jpg"),radius: 80,),
                      const SizedBox(height: 10,),
                      Text('Djebbar Aymen',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueGrey),),
                      const SizedBox(height: 20,),
                      Text(now),
                      const SizedBox(height: 20,),
                      Text(tweet.post,style: TextStyle(fontSize: 15),),
                      SizedBox(height: 150,),
                      IconButton(onPressed:playVoice, icon:Icon(Icons.mic),iconSize: 35,color: Colors.red,)

                      
                         ],
                        ),
          ],
        ),
        
      ),

      
    ));
  }
}
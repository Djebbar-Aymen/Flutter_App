import 'package:flutter/material.dart';
import 'package:tp4_application/widgets/details.dart';
import 'package:tp4_application/widgets/user_tweets.dart';
import '../models/Tweet.dart';
import './user_tweets.dart';
class Tweets extends StatefulWidget {
  

  @override
  State<Tweets> createState() => Tweets_State();
}

class Tweets_State extends State<Tweets> {
    List <Tweet> tweets_list=[
    Tweet(post: 'tit for tat'),
    Tweet(post: 'he who has a why , can bear anyhow')
   
  ];
  final TextEditingController textFieldController = TextEditingController();
   append_tweet(){
    setState(() {
      tweets_list.add(Tweet(post:textFieldController.text ));

    });}
    
      
    
   
    

   
   Future<void> addtweet() async {
	return showDialog<void>(
	  context: context,
	  barrierDismissible: false,
	  builder: (BuildContext context) {
	    return AlertDialog(
	      title: const Text('Add a tweet'),
	      content: TextField(
	        controller: textFieldController,
	        decoration: const InputDecoration(labelText: 'Whats on your mind'),
	      ),
	      actions: <Widget>[
	        TextButton(
	          child: const Text('Add'),
	          onPressed:()  {append_tweet();
            Navigator.of(context, rootNavigator: true).pop();}
	        ),
	      ],
	    );
	  },
	);
}  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Tweeting',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
        actions: [
          IconButton(onPressed:() => addtweet(), icon: Icon(Icons.add_circle_outline_rounded ,color: Colors.white,size: 29,))]

      ),
      body: ListView.separated(
      padding: EdgeInsets.all(12),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),
      itemCount: tweets_list.length,
      itemBuilder: (BuildContext context,int index){
        return GestureDetector(
          onTap:(){ Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Details(),settings: RouteSettings(arguments: tweets_list[index])),
          );},
          onLongPress:(){
             showDialog<void>(
	          context: context,
	           barrierDismissible: false,
	               builder: (BuildContext context) {
	               return AlertDialog(
	             title: const Text('delete tweet'),
	            content: Text("Are you really sure about deleting this tweet!"),
	      actions: <Widget>[
	        TextButton(
	          child: const Text('remove'),
            
	          onPressed:()  {setState(() {
              tweets_list.remove(tweets_list[index]);
            Navigator.of(context, rootNavigator: true).pop();
	            
	          });}
	        ),
	      ],
	    );
	  },
	);
          },
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundImage: AssetImage("assets/images/download (2).jpg"),radius: 25,),
                const SizedBox(width: 10,),
                Text('Djebbar Aymen',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),],
        
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 3,top: 5),
                child: Text('${tweets_list[index].post}',style: TextStyle(fontSize: 16,),),
              )
             
            ],
          ),
        );


      } )
);
         
          

        

        
   
      
      
      
      
    
  }



  }














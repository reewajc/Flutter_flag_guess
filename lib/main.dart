import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

  


 List countriesFlag = ['estonia', 'france','germany','ireland','italy','monaco','nigeria','poland','russia','spain','uk','us'];

 String flagTitle = "";
 int score = 0;
void main()=>runApp(GuessFlag());

class GuessFlag extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    countriesFlag.shuffle();
     var rand = math.Random();
    int correctAnswer = rand.nextInt(3);
    flagTitle = countriesFlag[correctAnswer];

    return MaterialApp(
      
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(title: Text('Flag Guess Game', style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.greenAccent,
          
          
        ),)),
        // body:  GuessFlagPadding(),
        body: Column(
          
          children: <Widget>[
             Text(flagTitle.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 30), ),
            GuessFlagPadding(),
          ],
        ),
      
       
        
      ),
      
    );
  }
}

class GuessFlagPadding extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
   
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: Column(
       
       children: <Widget>[
        
        FlagButton(flag: countriesFlag[0], onPressed: (){
          if(countriesFlag[0]==flagTitle){
            
            print("correct");
            score++;
            print(score);
      
          }
          else{
           print('incorrect');
           score--;
           print(score);

          }
         Navigator.push(context, MaterialPageRoute(builder: (context)=>GuessFlag()));
          print('You pressed ${countriesFlag[0]} button');
          
        },),
        FlagButton(flag:countriesFlag[1], onPressed: (){
          if(countriesFlag[1]==flagTitle){
            
            print("correct");
             score++;
            print(score);
          }
          else{
           print('incorrect');
           score--;
           print(score);
          }
          Navigator.push(context, MaterialPageRoute(builder: (context)=>GuessFlag()));
          print('You pressed ${countriesFlag[1]} button');
        },),
        FlagButton(flag:countriesFlag[2], onPressed: (){
          if(countriesFlag[2]==flagTitle){
             score++;
            
          }
          else{
          
           score--;
           
          }
          Navigator.push(context, MaterialPageRoute(builder: (context)=>GuessFlag()));
         
        },),
             
         Text('Your score is: $score', 
         style: TextStyle(
           fontSize: 20,
           fontWeight: FontWeight.bold,
           color: Colors.white,
         ),),   
       ],     
        ),
    );
  }
}

class GuessFlagPaddingChildren extends StatelessWidget {
  final String flagName;
  GuessFlagPaddingChildren(this.flagName);
  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: EdgeInsets.all(8),
                          child: Container(
          
          child: Column(
            
            children: <Widget>[
            
              Image.asset('images/$flagName@3x.png'),
            ],
          )
        ),
    );
  }
}

// BoxDecoration myBoxDecoration() {
//   return BoxDecoration(
//     border: Border.all(
//       color: Colors.green,
//       width: 4,
//     ),
//     borderRadius: BorderRadius.circular(50),
  
    
//   );
// }



class FlagButton extends StatelessWidget {
  final String flag;
  final Function onPressed;
  
  FlagButton( { this.flag, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape:  RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      onPressed:onPressed,
      child:  Column(
        children: <Widget>[
           GuessFlagPaddingChildren(flag),
        ],
      ),
     
      
    );
  }
}


  


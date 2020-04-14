//import 'global.dart';
import 'package:flutter/cupertino.dart';
//import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:flutter_audio_query/flutter_audio_query.dart';





class NowPlay extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _NowPlay();
  }

}

class _NowPlay extends State<NowPlay>{





  @override
  Widget build(BuildContext context) {
    return null;
  //   return Stack(
  //   children: <Widget>[
  //     Container(
  //             alignment: AlignmentDirectional.center,
  //             // height: 1000,
  //             // width: 400,
  //             decoration: BoxDecoration(
  //                 image:
  //                 DecorationImage(
  //                     image: img.image,
  //                     fit: BoxFit.cover)
  //                     )),
  //     Opacity(
  //       opacity: 0.68,
  //       child: Container(
  //         decoration: BoxDecoration(
  //             gradient: LinearGradient(
  //               begin: FractionalOffset.bottomCenter,
  //               end: FractionalOffset.topCenter,
  //               colors: [Colors.purple, Colors.red],
  //               stops: [0.5, 1.0],
  //             )),
  //       )),
  //     Column(
  //     children: <Widget>[
  //       Opacity(opacity: 0.98,
  //     child:
  //     Container(
  //       alignment: Alignment.center,
  //       padding: EdgeInsets.only(left:18,top:10,bottom:10),
  //       //width: 400,
  //       //color: Colors.black87,
  //       child: 
  //     Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         Text(
  //           mocktitle,
  //           style: TextStyle(
  //             fontSize:22,
  //             color:Colors.white
  //           ),
  //         ),
  //         SizedBox(height: 5,),
  //         Text(
  //           mockartist,
  //           style: TextStyle(
  //             fontSize:14,
  //             color:Colors.white
  //           ),
  //         ),
  //     ],)
  //     )),
  //     Expanded(child: SizedBox(),),
  //     Slider(
  //       activeColor: secondaryColor,
  //       inactiveColor: primaryColor,
  //       value: nowPlayingSlider,
  //       onChanged: (double x) {
  //         setState(() {
  //           var duration= double.parse(songs[i].duration);
  //           duration=duration/1000;
  //           nowPlayingSlider=x;
  //           audioPlayer.seek(x*duration);
  //         });
  //       }),
  //     Opacity(opacity: 0.95,
  //     child:
  //     Container(
  //       color: Colors.black87,
  //       height: 80,
  //       child: 
  //     Row(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //           FlatButton(
  //           shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
  //           child: Icon(Icons.navigate_before, color:iconColor,size:50),
  //           highlightColor: secondaryColor,
  //           splashColor: secondaryColor,
  //           onPressed: (){
  //             i--;
  //               if(i==-1)
  //                 i=songs.length-1;
  //             mockpath=songs[i].filePath;
  //             stop();
  //             localFilePath=mockpath;
  //               _playLocal();
  //             setState(() {
  //               status="Playing";
  //               mockartist=songs[i].artist;
  //               mocktitle=songs[i].title;
  //               mockpath=songs[i].filePath;
  //               localFilePath=mockpath;
  //               _playLocal();
  //               var path = songs[i].albumArtwork;
  //               if(path==null)
  //                 img = Image(image: AssetImage("assets/onthefloor.jpg"));
  //               else{
  //                 File f = new File(path);
  //                 if(!f.existsSync())
  //                 {
  //                   img = Image(image: AssetImage("assets/onthefloor.jpg"));
  //                 }
  //               else
  //               img =Image.file(File(path));
  //               }
                
  //             });

  //           })
  //     ,
  //           SizedBox(width:10),
  //           Container(
  //       alignment: AlignmentDirectional.topCenter,
  //       height: 60,
  //       width: 60,
  //       decoration: BoxDecoration(
  //         //shape: BoxShape.circle,
  //         color: secondaryColor,
  //         borderRadius: BorderRadius.circular(30),
  //         //border: Border.all(color: Colors.white, width: 2)
  //       ),
  //       child: IconButton(
  //           icon: status=="Playing"
  //               ? Icon(Icons.pause, color:iconColor)
  //               : Icon(Icons.play_arrow, color:iconColor), 
  //           iconSize: 45,
  //           highlightColor: secondaryColor,
  //           onPressed: (){
  //             setState(()
  //             {
  //               if(status=="Playing")
  //               {
  //                 status="Pause";
  //                 pause();
  //               }
  //             else
  //               {
  //               status="Playing";
  //               play(songs[i].filePath);
  //               }
  //               });
  //           })
  //       )
  //           ,
  //           SizedBox(width:10),
            
  //           FlatButton(
  //             shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
  //           child: Icon(Icons.navigate_next, color:iconColor,size:50),
  //           highlightColor: secondaryColor,
  //           splashColor: secondaryColor,
  //           onPressed: (){
  //             i++;
  //                 if(i==songs.length)
  //                 i=0;
  //             mockpath=songs[i].filePath;
  //             stop();
  //             localFilePath=mockpath;
  //               _playLocal();
  //             setState(() {
  //               status="Playing";
  //               mockartist=songs[i].artist;
  //               mocktitle=songs[i].title;                
  //               var path = songs[i].albumArtwork;
                
  //               if(path==null)
  //                 img = Image(image: AssetImage("assets/onthefloor.jpg"));
  //               else{
  //                 File f = new File(path);
  //                 if(!f.existsSync())
  //                 {
  //                   img = Image(image: AssetImage("assets/onthefloor.jpg"));
  //                 }
  //               else
  //               img =Image.file(File(path));
  //               }
  //             });

  //           })
  //     ,
  //     ],)
  //     ))
  //   ],
  // )]);
  }

}
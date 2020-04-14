
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'global.dart';
//import 'dart:io';

class ArtistPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body:
          Container(
            color: primaryColor,
            //child: getArtistsList()
          ) 
            
         );
  }

  

}

// Widget getArtistsList() {
//   //int ss=0;
  
//   Widget listview = ListView.builder(
//     itemCount: allArtists.length,
//     itemBuilder: (context,index){
//     //   if(songs[index].artist.contains(allArtists[index])){
//     //     ss++;
//     //   }
//     // var sss= (ss==1)?"1 song":"$ss songs";
//     return ListTile(
//       title:Text(
//         allArtists[index],
//         style: TextStyle(
//           color: iconColor
//         )),
//     //  subtitle:Text(sss),
//       leading: Icon(Icons.music_note, color: iconColor,),
//       onTap: (){
//         Navigator.push(context,
//         MaterialPageRoute(builder: (context)
//           {
//             var path=allArtistsImage[index];
//             Image img;
//             if(path==null)
//                   img = Image(image: AssetImage("assets/onthefloor.jpg"),fit: BoxFit.cover,);
//                 else{
//                   File f = new File(path);
//                   if(!f.existsSync())
//                   {
//                     img = Image(image: AssetImage("assets/onthefloor.jpg"),fit: BoxFit.cover,);
//                   }
//                 else
//                 img =Image.file(File(path),fit: BoxFit.cover,);
//                 }
//             return 
//             Scaffold(
//       body: NestedScrollView( 
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             SliverAppBar(
//               backgroundColor: secondaryColor,
//               expandedHeight: 200.0,
//               floating: false,
//               pinned: true,
//               flexibleSpace: FlexibleSpaceBar(
//                   centerTitle: true,
//                   title: Text(allArtists[index],
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16.0,
//                       )),
//                   background: img),
//             ),
//           ];
//         },
//               body: Container(
//                 color: primaryColor,
//                 child: ListView(
//                   children: 
//                     getArtistSongs(allArtists[index])
//                 )
//               )
//       ),
//     );
//             }));
//       }
//     );
//   });
//   return listview;
//   }

//   List getArtistSongs(String artist){
//     if(artist=="Unknown Artist")
//       artist="<unknown>";
//     List<Widget> list = List<Widget>();
//     for(int index=0;index<songs.length;index++)
//     {  
//       if(songs[index].artist.contains(artist)){
//         int dur= double.parse(songs[index].duration).ceil();
//         dur =dur ~/ 1000;
//         var min = dur ~/ 60;
//         var sec = dur%60<10?"0${dur%60}":dur%60;
//         list.add(
//           ListTile(
//           title:Text(songs[index].title, style: TextStyle(
//           color: iconColor
//         ) ),
//           subtitle:Text("$min:$sec", style: TextStyle(
//           color: iconColor
//         )),
//           leading: Icon(Icons.music_note, color: tertiaryColor,),
//           onTap: (){
                  
//           }
//         )
//         );
//       }
//     }
// return list;
//   }


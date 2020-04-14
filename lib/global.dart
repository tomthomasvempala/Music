import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class Song{
  String title,album;
  List artists = List <String>();
}

List<String> allArtists = List<String>();
List<String> allArtistsImage = List<String>();
List<Song> songsdata =List<Song>();
List<SongInfo> songs= List<SongInfo>();
final FlutterAudioQuery audioQuery = FlutterAudioQuery();
Color primaryColor = Colors.black87, secondaryColor = Colors.indigo[900], iconColor =Colors.white,tertiaryColor= Colors.pink[500];

getSongs() async{
  songs = await audioQuery.getSongs();
  for(int i=0;i<songs.length;i++){
    print("${songs[i].title}-${songs[i].artist}-${songs[i].duration}-${songs[i].filePath}");
    var duration= double.parse(songs[i].duration);
    duration=duration/1000;
    if(duration<5){
      songs.removeAt(i--);
      continue;
    }
    songs.sort((a,b) => a.title.compareTo(b.title));
    addArtists(songs[i].artist,songs[i].albumArtwork);
  }
      for(int i=0;i<allArtists.length;i++){
        print("$i-${allArtists[i]}");
        if(allArtists[i]=="<unknown>")
          allArtists[i]="Unknown Artist";
        }

      final Map<String, String> mappings = {
    for (int i = 0; i < allArtists.length; i++)
      allArtists[i]: allArtistsImage[i]
  };
    allArtists.sort();
    allArtistsImage = [
    for (String x in allArtists) mappings[x]
  ];
}

String multiple(String x){
  if(x.split(", ")[0]!=x)
    return ", ";
  if(x.split("&")[0]!=x)
    return " & ";
  if(x.split(" ft. ")[0]!=x)
    return " ft. ";
  if(x.split("feat. ")[0]!=x)
    return " feat. ";
  if(x.split(" and ")[0]!=x)
    return " and ";
  if(x.split("/")[0]!=x)
    return "/";
  return "okay";
}
addArtists(String x,String albArt){
  
  var temp;
    //x= "Jennifer Lopez, Jennifer Lopez, Miley Cyrus ft. Pitbull";
    while(multiple(x)!="okay"){
      temp=x.split(multiple(x))[0];
      // if(!((allArtists.contains(temp))))
      //   allArtists.add(temp);
      addArtists(temp,albArt);
      x=x.substring(temp.length+multiple(x).length);
    }
    if(!((allArtists.contains(x)))){
      allArtists.add(x);
      allArtistsImage.add(albArt);
    }
    if(allArtistsImage[allArtists.indexOf(x)]==null){
      allArtistsImage[allArtists.indexOf(x)]=albArt;
    }
    


}


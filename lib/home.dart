import 'package:flutter/material.dart';
import 'global.dart';
import 'dart:io';
import 'package:flute_music_player/flute_music_player.dart';
import 'dart:async';


enum PlayerState { stopped, playing, paused }
bool searching = false;


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {

Widget nowPlaying(){
  return 
                  Scaffold
                  (
                    body:Stack(alignment: Alignment.topCenter, children: <Widget>[
                Column(
                  children: <Widget>[
                    Opacity(
                        opacity: 0.98,
                        child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    alignment: AlignmentDirectional.center,
                                    height: 500,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: img.image,
                                            fit: BoxFit.cover))),
                              ],
                            ))),
                    // Opacity(
                    //     opacity: 0.95,
                    //     child: Container(
                    //       color: Colors.black87,
                    //       height: 80,
                    //     )),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Opacity(
                        opacity: 1,
                        child: Container(
                          height: 500,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: FractionalOffset.bottomCenter,
                            end: FractionalOffset.topCenter,
                            colors: [
                              Colors.indigo[900],
                              Colors.indigo[900].withOpacity(0.5)
                            ],
                            stops: [0, 1.0],
                          )),
                        )),
                    Expanded(
                        child: Opacity(
                            opacity: 1,
                            child: Container(
                              color: Colors.indigo[900],
                            )))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(10),
                        height: 500,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(child: SizedBox(height: 344)),
                              Text(
                                mocktitle,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  width: 300,
                                  child: Text(
                                    mockartist,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  )),
                            ])),
                    Slider(
                        activeColor: tertiaryColor,
                        inactiveColor: primaryColor,
                        value: (nowPlayingSlider)/mockduration,
                        onChanged: (double x) {
                          setState(() {
                            var duration = double.parse(songs[i].duration);
                            duration = duration / 1000;
                            nowPlayingSlider = x;
                            audioPlayer.seek(x * duration);
                          });
                        }),
                    Container(
                      padding: EdgeInsets.only(left: 20,right:20),
                      child:
                      Row(
                      children: <Widget>[
                        Text(nowPlayingTimerRunning,
                        style: TextStyle(
                          color:Colors.white
                        ),                        
                        ),
                        Expanded(child: SizedBox(),),
                        Text(nowPlayingTimerTotal,
                        style: TextStyle(
                          color:Colors.white
                        ),
                        )
                      ],
                    )
                    
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Icon(Icons.fast_rewind,
                                color: iconColor, size: 50),
                            highlightColor: secondaryColor,
                            splashColor: secondaryColor,
                            onPressed: () {
                              setState(() {
                                i--;
                                songChanged();
                              });
                            }),
                        SizedBox(width: 10),
                        Container(
                            alignment: AlignmentDirectional.topCenter,
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              color: tertiaryColor,
                              borderRadius: BorderRadius.circular(30),
                              //border: Border.all(color: Colors.white, width: 2)
                            ),
                            child: IconButton(
                                icon: status == "Playing"
                                    ? Icon(Icons.pause, color: iconColor)
                                    : Icon(Icons.play_arrow, color: iconColor),
                                iconSize: 45,
                                highlightColor: secondaryColor,
                                onPressed: () {
                                  setState(() {
                                    if (status == "Playing") {
                                      status = "Pause";
                                      pause();
                                    } else {
                                      status = "Playing";
                                      play(songs[i].filePath);
                                    }
                                  });
                                })),
                        SizedBox(width: 10),
                        FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Icon(Icons.fast_forward,
                                color: iconColor, size: 50),
                            highlightColor: secondaryColor,
                            splashColor: secondaryColor,
                            onPressed: () {
                              setState(() {
                                i++;
                                songChanged();

                              });
                            }),
                      ],
                    )
                  ],
                )
              ]));
}


  Widget getArtistsList() {

    Widget listview = ListView.builder(
        itemCount: allArtists.length,
        itemBuilder: (context, index) {
          return ListTile(
              title:
                  Text(allArtists[index], style: TextStyle(color: iconColor)),
              leading: Icon(
                Icons.music_note,
                color: iconColor,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  var path = allArtistsImage[index];
                  Image imgaa;
                  if (path == null)
                    imgaa = Image(
                      image: AssetImage("assets/onthefloor.jpg"),
                      fit: BoxFit.cover,
                    );
                  else {
                    File f = new File(path);
                    if (!f.existsSync()) {
                      imgaa = Image(
                        image: AssetImage("assets/onthefloor.jpg"),
                        fit: BoxFit.cover,
                      );
                    } else
                      imgaa = Image.file(
                        File(path),
                        fit: BoxFit.cover,
                      );
                  }
                  return Scaffold(
                    body: NestedScrollView(
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            SliverAppBar(
                              backgroundColor: secondaryColor,
                              expandedHeight: 200.0,
                              floating: false,
                              pinned: true,
                              flexibleSpace: FlexibleSpaceBar(
                                  centerTitle: true,
                                  title: Text(allArtists[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      )),
                                  background: imgaa),
                            ),
                          ];
                        },
                        body: Container(
                            color: primaryColor,
                            child: ListView(
                                children: getArtistSongs(allArtists[index])))),
                  );
                }));
              });
        });
    return listview;
  }

  List getArtistSongs(String artist) {
    if (artist == "Unknown Artist") artist = "<unknown>";
    List<Widget> list = List<Widget>();
    for (int index = 0; index < songs.length; index++) {
      if (songs[index].artist.contains(artist)) {
        int dur = double.parse(songs[index].duration).ceil();
        dur = dur ~/ 1000;
        var min = dur ~/ 60;
        var sec = dur % 60 < 10 ? "0${dur % 60}" : dur % 60;
        list.add(ListTile(
            title: Text(songs[index].title, style: TextStyle(color: iconColor)),
            subtitle: Text("$min:$sec", style: TextStyle(color: iconColor)),
            leading: Icon(
              Icons.music_note,
              color: tertiaryColor,
            ),
            onTap: () {
              setState(() {
                i = index;
                mockpath = songs[i].filePath;
                stop();
                localFilePath = mockpath;
                _playLocal();
                status = "Playing";
                mockartist = songs[i].artist;
                mocktitle = songs[i].title;
                mockpath = songs[i].filePath;
                mockduration = double.parse(songs[i].duration);
                localFilePath = mockpath;
                _playLocal();
                var path = songs[i].albumArtwork;
                if (path == null)
                  img = Image(image: AssetImage("assets/onthefloor.jpg"));
                else {
                  File f = new File(path);
                  if (!f.existsSync()) {
                    img = Image(image: AssetImage("assets/onthefloor.jpg"));
                  } else
                    img = Image.file(File(path));
                }
              });
            }));
      }
    }
    return list;
  }

  List getAllSongs(String s) {
    List<Widget> list = List<Widget>();
    for (int index = 0; index < songs.length; index++) {
      Image imgee;
      var path = songs[index].albumArtwork;
      if (path == null)
        imgee = Image(image: AssetImage("assets/onthefloor.jpg"));
      else {
        File f = new File(path);
        if (!f.existsSync()) {
          imgee = Image(image: AssetImage("assets/onthefloor.jpg"));
        } else
          imgee = Image.file(File(path));
      }
      int dur = double.parse(songs[index].duration).ceil();
      dur = dur ~/ 1000;
      var min = dur ~/ 60;
      var sec = dur % 60 < 10 ? "0${dur % 60}" : dur % 60;
      if(songs[index].title.toLowerCase().contains(s.toLowerCase())||s=="")
      list.add(ListTile(
          title: Text(songs[index].title, style: TextStyle(color: iconColor)),
          subtitle: Text("$min:$sec", style: TextStyle(color: iconColor)),
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imgee.image)),
          ),
          onTap: () {
            setState(() {
              i = index;
              mockpath = songs[i].filePath;
              stop();
              localFilePath = mockpath;
              _playLocal();
              status = "Playing";
              mockartist = songs[i].artist;
              mocktitle = songs[i].title;
              mockpath = songs[i].filePath;
              localFilePath = mockpath;
              mockduration = double.parse(songs[i].duration);
              _playLocal();
              var path = songs[i].albumArtwork;
              if (path == null)
                img = Image(image: AssetImage("assets/onthefloor.jpg"));
              else {
                File f = new File(path);
                if (!f.existsSync()) {
                  img = Image(image: AssetImage("assets/onthefloor.jpg"));
                } else
                  img = Image.file(File(path));
              }
            });
          }));
    }
    return list;
  }

  var status = "Playing";
  int i = 0;
  MusicFinder audioPlayer = new MusicFinder();

  String mocktitle = "On the Floor",
      mockartist = "Jenifer Lopez",
      kUrl,
      mockpath;
  double mockduration =240;
  double nowPlayingSlider=0;
  Image img = Image(image: AssetImage('assets/onthefloor.jpg'));
  Duration duration;
  Duration position;
  String localFilePath;
  String nowPlayingTimerRunning,nowPlayingTimerTotal;
  bool showingNowPlaying=false;
  var allSongsList ;

  PlayerState playerState = PlayerState.stopped;

  get isPlaying => playerState == PlayerState.playing;
  get isPaused => playerState == PlayerState.paused;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';
  get positionText =>
      position != null ? position.toString().split('.').first : '';

  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    initAudioPlayer();
    allSongsList=getAllSongs("");
    nowPlayingSlider=0;
    nowPlayingTimerTotal="0:00";
    nowPlayingTimerRunning="0:00";
    
    stop();
  }

  Future initAudioPlayer() async {
    audioPlayer = new MusicFinder();
    var songs;
    try {
      songs = await MusicFinder.allSongs();
    } catch (e) {
      print(e.toString());
    }

    print(songs);
    audioPlayer.setDurationHandler((d) => setState(() {
          duration = d;
        }));

    audioPlayer.setPositionHandler((p) => setState(() {
          nowPlayingSlider=p.inMilliseconds.toDouble();
          //print(p.inMilliseconds);  
          position = p;

          int dur = nowPlayingSlider.ceil();
          dur = dur ~/ 1000;
          var min = dur ~/ 60;
          var sec = dur % 60 < 10 ? "0${dur % 60}" : dur % 60;
          nowPlayingTimerRunning="$min:$sec";
        }));

    audioPlayer.setCompletionHandler(() {
      onComplete();
      setState(() {
        position = duration;
      });
    });

    audioPlayer.setErrorHandler((msg) {
      setState(() {
        playerState = PlayerState.stopped;
        duration = new Duration(seconds: 0);
        position = new Duration(seconds: 0);
      });
    });

    setState(() {
      print(songs.toString());
    });
  }

  songChanged(){
    int dur = double.parse(songs[i].duration).ceil();
      dur = dur ~/ 1000;
      var min = dur ~/ 60;
      var sec = dur % 60 < 10 ? "0${dur % 60}" : dur % 60;
      nowPlayingTimerTotal="$min:$sec";

      if (i == songs.length) i = 0;
      if(i==-1) i= songs.length-1;
      mockpath = songs[i].filePath;
      stop();
      localFilePath = mockpath;
      mockduration = double.parse(songs[i].duration);
      _playLocal();
      status = "Playing";
      mockartist = songs[i].artist;
      mocktitle = songs[i].title;
      var path = songs[i].albumArtwork;
      nowPlayingSlider=0;
      if (path == null)
        img = Image(image: AssetImage("assets/onthefloor.jpg"));
      else {
        File f = new File(path);
        if (!f.existsSync()) {
          img = Image(image: AssetImage("assets/onthefloor.jpg"));
        } else
          img = Image.file(File(path));
      }
  }

  Future play(var songpath) async {
    final result = await audioPlayer.play(songpath);
    if (result == 1)
      setState(() {
        print('_AudioAppState.play... PlayerState.playing');
        playerState = PlayerState.playing;
      });
  }

  Future _playLocal() async {
    final result = await audioPlayer.play(localFilePath, isLocal: true);
    if (result == 1) setState(() => playerState = PlayerState.playing);
  }

  Future pause() async {
    final result = await audioPlayer.pause();
    if (result == 1) setState(() => playerState = PlayerState.paused);
  }

  Future stop() async {
    final result = await audioPlayer.stop();
    if (result == 1)
      setState(() {
        playerState = PlayerState.stopped;
        position = new Duration();
        //nowPlayingSlider=0;
      });
  }

  Future mute(bool muted) async {
    final result = await audioPlayer.mute(muted);
    if (result == 1)
      setState(() {
        isMuted = muted;
      });
  }

  void onComplete() {
    setState(() {
      playerState = PlayerState.stopped;
      i++;
      songChanged();
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {

    // final oneSec = const Duration(seconds:1);
    // new Timer.periodic(oneSec, (Timer t) {
      
    //     setState(() {
    //       if(status=="Playing")
    //         {
    //           nowPlayingSlider++;
    //           print("hi");
    //         }
    //     });
        
    //    }
    //    );

      Future <bool> _onBackPressed(){
        if(showingNowPlaying)
          {
            setState(() {
              showingNowPlaying=false;
            });
            return Future.value(false);
          }
          else
            return Future.value(true);
          
      }

    return 
      WillPopScope(
        onWillPop: 
        _onBackPressed
        ,
              child: Stack
        (children:<Widget>[
        DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: secondaryColor,
            bottom: TabBar(
              onTap: (x){
                setState(() {
                  allSongsList=getAllSongs("");
                });
              },
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2,
              labelStyle: TextStyle(fontSize: 16),
              tabs: [
                Tab(
                  text: 'GENRE',
                ),
                Tab(
                  text: 'ARTISTS',
                ),
                Tab(
                  text: 'ALL',
                )
              ],
            ),
            title: Text("Music",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            centerTitle: false,
          ),
          body: Container(
              color: primaryColor,
              child: TabBarView(children: [
                ListView(
                  children: <Widget>[],
                ),
                Scaffold(
                    body:
                        Container(color: primaryColor, child: getArtistsList())),
                Scaffold(
                    body: Container(
                        padding: EdgeInsets.only(right:10,left:10),
                        color: primaryColor,
                        child: 
                          Column(children: <Widget>[
                            
                              TextField(
                              style: TextStyle(
                                color:iconColor
                              ),
                              onChanged: (string){
                                setState(() {

                                  allSongsList=getAllSongs(string);
                                });
                              }
                              ,
                            ),
                            Expanded(child: 
                              ListView(children: allSongsList
                            ))
                            
                          ],)
                          )),
              ])),
          drawer: Container(
              height: 700,
              width: 200,
              color: primaryColor,
              child: Column(
                children: <Widget>[
                  RaisedButton(child: Text("data"), onPressed: () {})
                ],
              )),

          bottomNavigationBar: GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dx > 0) {
               i--;
               songChanged();
              }
              if (details.delta.dx < -0) {
               i++;
               songChanged();
              }
            },
            onTap: (){
                  setState(() {
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return nowPlaying();
                
                  // }));
                  showingNowPlaying=true;
                  });
                  
                },
                child:
            SizedBox(
              height:80,
                          child: ListTile(
                
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: img.image)),
                ),
                title: Text(mocktitle,style: TextStyle(fontSize:20),maxLines: 1,),
                subtitle: Text(mockartist),
                trailing: IconButton(icon: status == "Playing"
                                      ? Icon(Icons.pause)
                                      : Icon(Icons.play_arrow),
                                      iconSize: 30,
                 onPressed: () {
                                    setState(() {
                                      if (status == "Playing") {
                                        status = "Pause";
                                        pause();
                                      } else {
                                        status = "Playing";
                                        play(songs[i].filePath);
                                      }
                                    });
                                  }),
                ),
            ),
            
          ),
        ),
    ),
    showingNowPlaying?nowPlaying():Container()
    
    ]),
      );
  }
}

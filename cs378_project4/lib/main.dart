import 'package:flutter/material.dart';
import 'VideoClick.dart';
import 'AudioClick.dart';

/*
packages used fo project specifications:

audioplayers:
  used to load mp3 files from the asset folder.
  The audioplayers package is a package that allows for simultaneous audio file playback that works
  for multiple different devices.
  I have used this solely within a page that contains the artist name, song name, song image.
  The page also contains a slider that is functional.

appinio_video_player:
  used to load mp4 videos from the asset folder.
  The main difference between this video player compared to the official video_player package,
  is that appinio_video_player allows developers to change the way that icons look, it also allows
  for a fullscreen view as well as video settings that can be changed. Aside from that it contains most
  if not all of the same functionality.
  I have used this solely within a page that (much like the audio player page) contains the artist name,
  song name, song image (in the background). The page also contains video controls, as well as playback speed controls that are functional.

qr_flutter:
  used to generate a qr code depending on which page the user clicks on. Each song generates its own qr code.

  if the user were to click on the qr code on the songs' audio page, a bottom sheet would appear,
  and once they click on the button with text labeled spotify on it,
  it would lead them to either their web browser, where they listen to the particular song.
  if the user were to scan the qr code on another device,
  once scanned the qr code would lead them to a spotify page on the web browser allowing them to listen to the song on spotify.

  if the user were to click on the qr code on the video page, a bottom sheet would appear,
  and once they click on the button with text labeled youtube on it,
  it would lead them to either their web browser or their youtube app, where they can watch the video for the particular song.
  if the user were to scan the qr code on another device,
  once scanned the qr code would lead them to a youtube page on the web browser allowing them to see the video on youtube


other packages used not counted for project specifications(ONLY FOR FUNCTIONALITY):
  url_launcher:
    used to load url in browser when user clicks on qr code.

  dart:ui :
    used to have ImageFilter, so that background images can be blurred.

some songs are explicit.
 */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Music & Video App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[

            Container(margin: const EdgeInsets.all(8.0), width: 320.0, height: 95.0, padding:const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.greenAccent[100]),
              child: ListTile(
                leading: const Image(image: AssetImage("assets/images/noided.webp")),
                title: const Text("I've Seen Footage"),
                subtitle: const Text("Death Grips"),
                trailing: Wrap(
                  spacing: 0,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.audiotrack_sharp),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AudioClick(
                              name: "I've Seen Footage",
                              artist: "Death Grips",
                              image: "assets/images/noided.webp",
                              audio: "audio/noided.mp3",
                              urls: "https://open.spotify.com/track/7nCONy10IHp7XD3oYZ0lcx",
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.videocam),
                      onPressed: () {
                        Navigator.push(
                          context,
                           MaterialPageRoute(
                            builder: (context) => VideoClick(
                              name: "I've Seen Footage",
                              artist: "Death Grips",
                              image: "assets/images/noided.webp",
                              video: "assets/videos/noided.mp4",
                              urls: "https://www.youtube.com/watch?v=sticXkHxZC4",
                            ),
                          ),
                        );
                      },
                    ),
                  ]
                )
              ),
            ),
            Container(margin: const EdgeInsets.all(8.0), width: 320.0, height: 95.0, padding:const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.greenAccent[100]),
              child: ListTile(
                  leading: const Image(image: AssetImage("assets/images/freeformjazz.jpg")),
                  title: const Text("Spacemountain"),
                  subtitle: const Text("Uyama Hiroto"),
                  trailing: Wrap(
                      spacing: 0,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.audiotrack_sharp),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AudioClick(
                                  name: "Spacemountain",
                                  artist: "Uyama Hiroto",
                                  image: "assets/images/freeformjazz.jpg",
                                  audio: "audio/Spacemountain.mp3",
                                  urls: "https://open.spotify.com/track/2AARRTXDzkW02iqwtbjRXA",
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.videocam),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoClick(
                                  name: "Spacemountain",
                                  artist: "Uyama Hiroto",
                                  image: "assets/images/freeformjazz.jpg",
                                  video: "assets/videos/Spacemountain.mp4",
                                  urls: "https://www.youtube.com/watch?v=6SMLTGlprDc",
                                ),
                              ),
                            );
                          },
                        ),
                      ]
                  )
              ),
            ),
            Container(margin: const EdgeInsets.all(8.0), width: 320.0, height: 95.0, padding:const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.greenAccent[100]),
              child: ListTile(
                  leading: const Image(image: AssetImage("assets/images/modalsoul.png")),
                  title: const Text("World's End Rhapsody"),
                  subtitle: const Text("Nujabes"),
                  trailing: Wrap(
                      spacing: 0,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.audiotrack_sharp),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AudioClick(
                                  name: "World's End Rhapsody",
                                  artist: "Nujabes",
                                  image: "assets/images/modalsoul.png",
                                  audio: "audio/wer.mp3",
                                  urls: "https://open.spotify.com/track/7BBZGDSZbsb4Esi8YB94HT",
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.videocam),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoClick(
                                  name: "World's End Rhapsody",
                                  artist: "Nujabes",
                                  image: "assets/images/modalsoul.png",
                                  video: "assets/videos/wer.mp4",
                                  urls: "https://www.youtube.com/watch?v=0XJFSTYryv4",
                                ),
                              ),
                            );
                          },
                        ),
                      ]
                  )
              ),
            ),
            Container(margin: const EdgeInsets.all(8.0), width: 320.0, height: 95.0, padding:const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.greenAccent[100]),
              child: ListTile(
                  leading: const Image(image: AssetImage("assets/images/donuts.jpg")),
                  title: const Text("Don't Cry"),
                  subtitle: const Text("J Dilla"),
                  trailing: Wrap(
                      spacing: 0,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.audiotrack_sharp),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AudioClick(
                                  name: "Don't Cry",
                                  artist: "J Dilla",
                                  image: "assets/images/donuts.jpg",
                                  audio: "audio/dontcry.mp3",
                                  urls: "https://open.spotify.com/track/67c5M9gVWemCV5SGH5cc4v",
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.videocam),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoClick(
                                  name: "Don't Cry",
                                  artist: "J Dilla",
                                  image: "assets/images/donuts.jpg",
                                  video: "assets/videos/dontcry.mp4",
                                  urls: "https://www.youtube.com/watch?v=NHn-G_YpQB0",
                                ),
                              ),
                            );
                          },
                        ),
                      ]
                  )
              ),
            ),
            Container(margin: const EdgeInsets.all(8.0), width: 320.0, height: 95.0, padding:const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.greenAccent[100]),
              child: ListTile(
                  leading: const Image(image: AssetImage("assets/images/titlefight.jpg")),
                  title: const Text("Head In The Ceiling Fan"),
                  subtitle: const Text("Title Fight"),
                  trailing: Wrap(
                      spacing: 0,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.audiotrack_sharp),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AudioClick(
                                  name: "Head In The Ceiling Fan",
                                  artist: "Title Fight",
                                  image: "assets/images/titlefight.jpg",
                                  audio: "audio/hitcf.mp3",
                                  urls: "https://open.spotify.com/track/449LuMpoIOhxnW2B246Aau",
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.videocam),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoClick(
                                  name: "Head In The Ceiling Fan",
                                  artist: "Title Fight",
                                  image: "assets/images/titlefight.jpg",
                                  video: "assets/videos/hitcf.mp4",
                                  urls: "https://www.youtube.com/watch?v=Tu9KgGqXDyw",
                                ),
                              ),
                            );
                          },
                        ),
                      ]
                  )
              ),
            ),
            Container(margin: const EdgeInsets.all(8.0), width: 320.0, height: 95.0, padding:const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.greenAccent[100]),
              child: ListTile(
                  leading: const Image(image: AssetImage("assets/images/bn2m.jpg")),
                  title: const Text("Be Nice 2 Me"),
                  subtitle: const Text("Bladee"),
                  trailing: Wrap(
                      spacing: 0,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.audiotrack_sharp),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AudioClick(
                                  name: "Be Nice 2 Me",
                                  artist: "Bladee",
                                  image: "assets/images/bn2m.jpg",
                                  audio: "audio/bn2m.mp3",
                                  urls: "https://open.spotify.com/track/2TmqHjg7uhizGndzXQdFuf",
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.videocam),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoClick(
                                  name: "Be Nice 2 Me",
                                  artist: "Bladee",
                                  image: "assets/images/bn2m.jpg",
                                  video: "assets/videos/bn2m.mp4",
                                  urls: "https://www.youtube.com/watch?v=vcAp4nmTZCA",
                                ),
                              ),
                            );
                          },
                        ),
                      ]
                  )
              ),
            ),
            Container(margin: const EdgeInsets.all(8.0), width: 320.0, height: 95.0, padding:const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.greenAccent[100]),
              child: ListTile(
                  leading: const Image(image: AssetImage("assets/images/peroxide.png")),
                  title: const Text("Peroxide"),
                  subtitle: const Text("Ecco2k"),
                  trailing: Wrap(
                      spacing: 0,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.audiotrack_sharp),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AudioClick(
                                  name: "Peroxide",
                                  artist: "Ecco2k",
                                  image: "assets/images/peroxide.png",
                                  audio: "audio/peroxide.mp3",
                                  urls: "https://open.spotify.com/track/1fbmkoREwP13dkXJI5YGfn",
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.videocam),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoClick(
                                  name: "Peroxide",
                                  artist: "Ecco2k",
                                  image: "assets/images/peroxide.png",
                                  video: "assets/videos/peroxide.mp4",
                                  urls: "https://www.youtube.com/watch?v=Rs_kavGKeHI",
                                ),
                              ),
                            );
                          },
                        ),
                      ]
                  )
              ),
            ),
            Container(margin: const EdgeInsets.all(8.0), width: 320.0, height: 95.0, padding:const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.greenAccent[100]),
              child: ListTile(
                  leading: const Image(image: AssetImage("assets/images/fool.png")),
                  title: const Text("Egobaby"),
                  subtitle: const Text("Bladee"),
                  trailing: Wrap(
                      spacing: 0,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.audiotrack_sharp),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AudioClick(
                                  name: "Egobaby",
                                  artist: "Bladee",
                                  image: "assets/images/fool.png",
                                  audio: "audio/fool.mp3",
                                  urls: "https://open.spotify.com/track/5o6F1O26mp56RPkmyoSfQd",
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.videocam),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoClick(
                                  name: "Egobaby",
                                  artist: "Bladee",
                                  image: "assets/images/fool.png",
                                  video: "assets/videos/fool.mp4",
                                  urls: "https://www.youtube.com/watch?v=YbMrRegZ3H0",
                                ),
                              ),
                            );
                          },
                        ),
                      ]
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

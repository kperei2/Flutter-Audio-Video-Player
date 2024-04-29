import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class AudioClick extends StatefulWidget {
  String name;
  String artist;
  String image;
  String audio;
  String urls;

  AudioClick({Key? key, required this.name, required this.artist, required this.image, required this.audio, required this.urls,}) : super(key: key);

  @override
  State<AudioClick> createState() => _AudioClick();
}

class _AudioClick extends State<AudioClick> {
  final AudioPlayer audio = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();

    audio.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audio.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audio.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    audio.setSourceAsset(widget.audio);
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    audio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Container(
          width: 500.0,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(widget.image),
                    ),
                    Text(
                      widget.name,
                      style: const TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    Text(
                      widget.artist,
                      style: const TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    IconButton(
                      onPressed: () async {
                        if (isPlaying) {
                          await audio.pause();
                        } else {
                          await audio.resume();
                        }
                      },
                      icon: isPlaying
                          ? const Icon(Icons.pause_rounded)
                          : const Icon(Icons.play_arrow_rounded),
                      iconSize: 40,
                      color: Colors.white,
                    ),
                    Slider(
                      min: 0,
                      max: duration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble(),
                      onChanged: (val) async {
                        final position = Duration(seconds: val.toInt());
                        await audio.seek(position);
                      },
                      thumbColor: Colors.greenAccent,
                      activeColor: Colors.greenAccent,
                      inactiveColor: Colors.grey,
                    ),
                    if (widget.urls.isNotEmpty)
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Colors.white.withOpacity(0.25), // Adjust the opacity here
                        ),
                          child: GestureDetector(
                            onTap: (){
                              //launchURL(widget.urls);
                              showModalBottomSheet(context: context, builder: (BuildContext context){
                                return Container(
                                  height: 150,
                                  width: 500,
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            const Text("Link", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                                            Spacer(),
                                            IconButton(
                                              icon: const Icon(Icons.close_rounded),
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Image.asset("assets/images/spotify.png", height: 100, width: 100,),
                                            Spacer(),
                                            ElevatedButton(
                                              onPressed: (){
                                                launchURL(widget.urls);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.greenAccent,
                                                textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )
                                              ),
                                              child: Text("SPOTIFY", style: TextStyle(color: Colors.white),),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                            },
                            child: QrImageView(
                              data: widget.urls,
                              version: QrVersions.auto,
                              size: 200,
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

launchURL( String url)
{
  launch(url);
}
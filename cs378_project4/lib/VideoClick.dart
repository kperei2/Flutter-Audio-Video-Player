import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class VideoClick extends StatefulWidget{
  String name;
  String artist;
  String image;
  String video;
  String urls;

  VideoClick({ Key ? key, required this.name, required this.artist, required this.image, required this.video, required this.urls}) : super(key: key);
  @override
  State<VideoClick> createState()=> _VideoClick();
}

class _VideoClick extends State<VideoClick>{

  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState(){
    super.initState();
    initializeVideoPlayer();
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }


  @override
    Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       ),
       body: Center(
         child: Container(
           width: 500.0,
           child: Stack(
             children : <Widget>[
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
                         borderRadius: BorderRadius.circular(15),
                         child: CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerController,),
                       ),
                       Text(
                         widget.name,
                         style: const TextStyle(color: Colors.white, fontSize: 25.0),
                       ),
                       Text(
                         widget.artist,
                         style: const TextStyle(color: Colors.white, fontSize: 20.0),
                       ),
                       Container(
                         padding: const EdgeInsets.only(top: 30),
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
                                             Image.asset("assets/images/yt.png", height: 100, width: 100,),
                                             Spacer(),
                                             ElevatedButton(
                                               onPressed: (){
                                                 launchURL(widget.urls);
                                               },
                                               style: ElevatedButton.styleFrom(
                                                   backgroundColor: Colors.red,
                                                   textStyle: const TextStyle(
                                                     fontSize: 18,
                                                     fontWeight: FontWeight.bold,
                                                   )
                                               ),
                                               child: Text("YOUTUBE", style: TextStyle(color: Colors.white),),
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
         )
       )
     );
   }

   void initializeVideoPlayer(){
    VideoPlayerController videoPlayerController;
    videoPlayerController = VideoPlayerController.asset(widget.video)
      ..initialize().then((value){
        setState(() {

        });
      });
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: videoPlayerController);
   }
}

launchURL( String url)
{
  launch(url);
}
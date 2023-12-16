import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class _VideoPlayer extends StatefulWidget {
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<_VideoPlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/koudmen_1.mov');
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      // Ajouter des logs de débogage ici
      print("Video initialization successful");
    }).catchError((error) {
      // Ajouter des logs de débogage ici pour afficher l'erreur
      print("Error initializing video: $error");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            // Affiche une icône de chargement
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

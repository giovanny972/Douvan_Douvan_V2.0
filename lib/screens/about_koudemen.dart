import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/screens/Koudmen inscription/register_1_phase1 Koudmen.dart';
import 'package:koudmen/screens/Koudmen Augmenter Inscription/register_1_phase1Koudmen_Augmenter.dart';
import 'package:video_player/video_player.dart';
import 'dart:async' show Future;

class AboutKoudmenPage extends StatefulWidget {
  AboutKoudmenPage({Key? key}) : super(key: key);

  @override
  _AboutKoudmenPageState createState() => _AboutKoudmenPageState();
}

class _AboutKoudmenPageState extends State<AboutKoudmenPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              // Background

              Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(90),
                      bottomRight: Radius.circular(90),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF74E2DB), Color(0xFFE6D8FC)])),
              ),

              // Foreground
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    logoKarisko,
                    Column(
                      children: [
                        // Vidéo
                        Container(
                          height: size.height * 0.26,
                          width: size.width * 0.8,
                          child: _VideoPlayer(),
                        ),
                        SizedBox(height: 30),
                        // Text description
                        Text(
                          "Découvrez Koudmen Augmenté",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: lightPurpleCol,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 33,
                          width: 183,
                          // Bouton register
                          child: ElevatedButton(
                            onPressed: () {
                              // Redirection to another page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register1KoudmenPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: purpleCol,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                            ),
                            child: Text(
                              "Inscription Koudmen",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 33,
                          width: 183,

                          // Bouton register
                          child: ElevatedButton(
                            onPressed: () {
                              // Redirection to another page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Register1KoudmenAugmenterPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: purpleCol,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Inscription Koudmen.A",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),

                        // Text register
                        Text(
                          "Déjà enregistré ?",
                          style: TextStyle(
                            color: purpleCol,
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
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

class _VideoPlayer extends StatefulWidget {
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<_VideoPlayer> {
  late VideoPlayerController _controller;
  // ignore: unused_field
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/koudmen_1.mov');
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      print("Video initialization successful");
      // Lancer automatiquement la vidéo
      _controller.play();
    }).catchError((error) {
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
      // Vous pouvez définir la hauteur de la vidéo directement ici
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          VideoPlayer(_controller),
          Center(
            child: IconButton(
              icon: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
              onPressed: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

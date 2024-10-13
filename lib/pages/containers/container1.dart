import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:video_player/video_player.dart';
import 'package:web_app/utils/colors.dart';
import 'package:web_app/utils/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../utils/drawerprovider.dart';
import '../../utils/navigationprovider.dart';
import '../../widgets/navbar.dart';

class Container1 extends StatefulWidget {

  const Container1({super.key, });

  @override
  State<Container1> createState() => _Container1State();
}

class _Container1State extends State<Container1> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    // Initialize video from local assets (Make sure to use a network URL or file URL for production)
    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/background2.mp4');
    _videoPlayerController.setLooping(true);
    _videoPlayerController.setVolume(0.0);
    _videoPlayerController.initialize().then((_) {
      setState(() {
        _videoPlayerController.play();
      });
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: deskTopContainer1(),
      mobile: mobileContainer1(),
    );
  }

  //--------------Desktop--------------
  Widget deskTopContainer1() {
    return Stack(
      children: [
        SizedBox(
          width: w,
          height: h,
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _videoPlayerController.value.size.width,
              height: _videoPlayerController.value.size.height,
              child: VideoPlayer(_videoPlayerController),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.6), // Adjust opacity as needed
          ),
        ),
        Positioned(
          top: w! / 6,
          left: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainText(
                    fontsize: w! * 0.07,
                    text: "Get there quicker",
                  ),
                  Row(
                    children: [
                      MainText(fontsize: w! * 0.07, text: "Book with "),
                      AnimatedText(fontsize: w! * 0.07, width: w! / 2),
                    ],
                  )
                ],
              ),
              AnimatedText2(fontsize: w! / 60),
            ],
          ),
        ),
        // PopUpIcons Positioned at Bottom Right
        const Positioned(
          bottom: -25, // Add some padding to make it responsive
          right: 20,  // Add some padding for better placement
          child: Row(
            children: [
              PopUpIcons(
                color: Color(0xffFD07B0),
                icon: FontAwesome.instagram,
                title: "Instagram",
              ),
              PopUpIcons(
                color: Color(0xff0866FF),
                icon: FontAwesome.facebook,
                title: "Facebook",
              ),
              PopUpIcons(
                color: Color(0xffFF0033),
                icon: FontAwesome.youtube_play,
                title: "Youtube",
              ),
            ],
          ),
        )
      ],
    );
  }


  //---------------MOBILE----------------
  Widget mobileContainer1() {

    return Stack(
      children: [
        SizedBox(
          width: w,
          height: h,
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _videoPlayerController.value.size.width,
              height: _videoPlayerController.value.size.height,
              child: VideoPlayer(_videoPlayerController),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.6), // Adjust opacity as needed
          ),
        ),
        Positioned(
          top: h! *0.69,
          left: w!*0.05,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainText(
                    fontsize: w! * 0.09,
                    text: "Get there quicker",
                  ),
                  Row(
                    children: [
                      MainText(fontsize: w! * 0.09, text: "Book with "),
                      AnimatedText(fontsize: w! * 0.09, width: w! / 2),
                    ],
                  )
                ],
              ),
              AnimatedText2(fontsize: w!* 0.03),
            ],
          ),
        ),
      ],
    );
  }

}



class AnimatedText extends StatelessWidget {
  final double fontsize;
  final double width;
  const AnimatedText({super.key, required this.fontsize, required this.width});

  @override
  Widget build(BuildContext context) {
      return SizedBox(
       width: width,
       child: DefaultTextStyle(
         style:  Theme.of(context).textTheme.headlineLarge!.copyWith(
           color: AppColors.primaryColor, // Adjust color if needed
           fontSize: fontsize,
           fontWeight: FontWeight.bold,
         ),
         child: AnimatedTextKit(
           repeatForever: true,
           animatedTexts: [
             FadeAnimatedText('US!'),
             FadeAnimatedText('US NOW!!'),

           ],
           onTap: () {
             print("Tap Event");
           },
         ),
       ),
     );

  }
}


class MainText extends StatelessWidget {
  final double fontsize;
 final String text;
  const MainText({super.key, required this.fontsize, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        height: 1.1, // Adjust the line height as needed
      ),
    );
  }
}

class AnimatedText2 extends StatelessWidget {
  final double fontsize;
  const AnimatedText2({super.key, required this.fontsize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.0,
      child: DefaultTextStyle(
        style:  Theme.of(context).textTheme.headlineLarge!.copyWith(
          color: Colors.white, // Adjust color if needed
          fontSize: fontsize,
          fontWeight: FontWeight.w500,
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TypewriterAnimatedText('Reliable taxis, anytime, anywhere you go.'),
            TypewriterAnimatedText('Book taxis anytime, anywhere with ease.'),
            TypewriterAnimatedText('Dependable rides, anytime, any location.'),
            TypewriterAnimatedText('Trusted taxi service, wherever, whenever needed.'),
          ],
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
  }
}
class CarImage extends StatefulWidget {
  final double width, height;
  const CarImage({super.key, required this.height, required this.width});

  @override
  State<CarImage> createState() => _CarImageState();
}

class _CarImageState extends State<CarImage> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (e) {
        setState(() {
          isHover = false;
        });
      },
      child: AnimatedContainer(
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 100),
        width: isHover ? widget.width * 1.025 : widget.width,
        height: isHover ? widget.height * 1.025 : widget.height,
        decoration: BoxDecoration(
          border: Border.all(width: 3),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/car1.jpg'))
        ),

      ),
    );
  }
}


class PopUpIcons extends StatefulWidget {
  final Color color;
  final IconData icon;
  final String title;
  const PopUpIcons({super.key, required this.icon, required this.color, required this.title});

  @override
  State<PopUpIcons> createState() => _PopUpIconsState();
}

class _PopUpIconsState extends State<PopUpIcons> {
  bool onIt = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      width: 80,
      height: 120,
      child: Center(
        child: Stack(
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: onIt? 1 : 0,
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 200),
                alignment: onIt? const Alignment(0, -1): const Alignment(0, 0),
                child: Stack(clipBehavior: Clip.none, children: [
                  Positioned(
                    left: 35,
                    top: 30,
                    child: Transform(
                      transform: Matrix4.rotationZ(pi / 4),
                      alignment: FractionalOffset.center,
                      child: Container(
                        height: 10,
                        width: 10,
                        color: widget.color,
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: widget.color,
                    ),
                    child: Center(
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ]),
              ),
            ),
            MouseRegion(
              onEnter: (e){
                setState(() {
                  onIt = true;
                });
              },
              onExit: (e){
                setState(() {
                  onIt = false;
                });
              },
              cursor: SystemMouseCursors.click,
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: onIt? widget.color: Colors.white,
                
                  ),
                  child: Center(
                    child: Icon(widget.icon,color: onIt? Colors.white: widget.color,),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




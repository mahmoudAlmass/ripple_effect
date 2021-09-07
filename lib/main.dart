import 'package:flutter/material.dart';
import 'package:flutter_challenge_ripple/next_page.dart';
import 'package:flutter_challenge_ripple/next_page_button.dart';
import 'package:flutter_challenge_ripple/ripple.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Ripple Demo',
      
      home: Homematerial(),
      
    );
  }
}

class Homematerial extends StatefulWidget {
  var screenHeight;
  
  Homematerial({
    
    Key? key,
  }) : super(key: key);

  @override
  _HomematerialState createState() => _HomematerialState();
}

class _HomematerialState extends State<Homematerial> with TickerProviderStateMixin {
  final _mykey= GlobalKey<_RippleAnimationState>() ;

Future<void> _nextPage() async {
      await _mykey.currentState!.startAnimation();

    if(_mykey.currentState!._rippleAnimationController.status==AnimationStatus.completed)
    {
    
    Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (context,animation1,animation2)=>NextPage(),
      transitionDuration: Duration(seconds: 0)
      ));
      _mykey.currentState!._rippleAnimationController.reset();
    }
    }


  @override
  Widget build(BuildContext context) {
final screenHeight=MediaQuery.of(context).size.height;
print(screenHeight);
RippleAnimation _ripple = new RippleAnimation(screenHeight: screenHeight,key: _mykey);

    return Scaffold(
        backgroundColor: Colors.grey.shade800,
        body:Stack(
          children: <Widget>[
            _ripple,
            SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        NextPageButton(onPressed: _nextPage),
                      ],
                    ),
                  ),
                ),
              ),
            
            
          ],
        ),
      );
  }
}


class RippleAnimation extends StatefulWidget {
  final screenHeight;

  RippleAnimation({
    this.screenHeight,
    Key? key,
  
  }) :  super(key: key);

  

  @override
  _RippleAnimationState createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation> with TickerProviderStateMixin  {

  late Animation<double> _rippleAnimation;
  late final AnimationController _rippleAnimationController;
  

  @override
  void initState() {
  
    super.initState();
    
    _rippleAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _rippleAnimation = Tween<double>(
      begin: 0.0,
      end: widget.screenHeight,
    ).animate(CurvedAnimation(
      parent: _rippleAnimationController,
      curve: Curves.easeIn,
    ));

  }
  Future<void>startAnimation()async{
    await _rippleAnimationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
            animation: _rippleAnimation,
            builder: (_, Widget? child) {
              return Ripple(radius: _rippleAnimation.value);
            },
          );
  }
}

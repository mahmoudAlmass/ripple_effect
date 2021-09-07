import 'package:flutter/material.dart';
import 'package:flutter_challenge_ripple/main.dart';
class NextPage extends StatefulWidget {
  double _size=20;
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  void didChangeDependencies() async {
    
    super.didChangeDependencies();
    await Future.delayed(Duration(milliseconds: 0)).then( (v){
          
          setState(() {
            widget._size+=10;
          });
    });
  
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    backgroundColor: Colors.grey.shade800,
    elevation: 0,
    
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: ()=>Navigator.pushReplacement( context,
    PageRouteBuilder(
      pageBuilder: (context,animation1,animation2)=>MyApp(),
      transitionDuration: Duration(seconds: 0)
      )
      )
      ),
    ),
    backgroundColor: Colors.grey.shade800,
    body: Center(
      child: AnimatedDefaultTextStyle(
        duration: Duration(milliseconds: 500),
        style: TextStyle(fontSize: widget._size),
        child: Text('Next Page',
        style:
        TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold),
        ),
      ),
    ),
    );
}
}
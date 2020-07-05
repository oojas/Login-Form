import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class animation extends StatefulWidget {
  @override
  _animationState createState() => _animationState();
}

class _animationState extends State<animation> with TickerProviderStateMixin {
  Animation animation;
  AnimationController _controller;

  String name;
  String email;
  String password;
  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    /* animation.addListener(() {
      setState(() {
             });
      });*/
    _controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Animations",style: TextStyle(
                decorationThickness: 12,
                  decorationColor: Colors.deepOrange,
                fontStyle: FontStyle.italic,
                fontSize: 24,
                fontWeight: FontWeight.bold

              ),),
              backgroundColor: Colors.blueGrey.shade500,
              elevation: 18,

            ),
              body: Transform(
            transform:
                Matrix4.translationValues(animation.value * width, 0.0, 0.0),
            child: SingleChildScrollView(
                // scrollDirection: Axis.horizontal,
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 24,
                  ),
                  //  Text("Login",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.person),
                        hintText: "What should we call you?",
                        labelText: "Name *"),
                    onSaved: (String value) {
                      this.name = value;
                    },
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  //  Text("Login",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.email),
                        hintText: "What is your email?",
                        labelText: "Email *"),
                    onSaved: (String value) {
                      this.email = value;
                    },
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  //  Text("Login",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.phone),
                        hintText: "How should we contact you?",
                        labelText: "Number *"),
                    onSaved: (String value) {
                      this.email = value;
                    },
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  //  Text("Login",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.fingerprint),
                        hintText: "Your security keeper?",
                        labelText: "Password *"),
                    onSaved: (String value) {
                      this.password = value;
                    },
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.black,
                        child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                        fontStyle: FontStyle.italic,
                       fontSize: 24 ),),
                        onPressed: (){

                        },


                      ),

                    ],
                 ),
                  Text("Don't have an account?",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      RaisedButton(
                          child:Text("Sign in",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        color: Colors.green,
                        onPressed: (){

                        },
                      )
                    ],
                  )

                ],
              ),
            )),
          ));
        });
  }
}

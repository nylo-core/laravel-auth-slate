String stubAuthLanding() => '''
import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/extensions.dart';
import 'package:flutter_app/resources/pages/login_page.dart';
import 'package:flutter_app/resources/pages/register_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class AuthLandingPage extends NyStatefulWidget {
  final Controller controller = Controller();
  
  static const path = '/auth-landing';
  
  AuthLandingPage({Key? key}) : super(key: key);
  
  @override
  _AuthLandingPageState createState() => _AuthLandingPageState();
}

class _AuthLandingPageState extends NyState<AuthLandingPage> {

  @override
  init() async {
    super.init();
    
  }
  
  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: "38b48b".toHexColor(),
      body: SafeArea(
         child: Container(
           decoration: new BoxDecoration(
               gradient: new LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors: [
                   "38b48b".toHexColor(),
                   "0a423f".toHexColor()
                 ],
               )),
           width: double.infinity,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [

               ClipRRect(
                 borderRadius: BorderRadius.circular(16),
                 child: Container(
                   height: 200,
                   width: 200,
                   child: Image.network("https://cdn.dribbble.com/users/789882/screenshots/19529118/media/4a1ca38badeb5a486821e64c6b566947.png", fit: BoxFit.cover,),
                 ),
               ),

               Column(
                 children: [
                   Text("Let's get started").headingLarge(context).fontWeightBold().setColor(context, (color) => Colors.white),
                   Text("Try our new app", style: TextStyle(color: Colors.white),),
                 ],
               ),

               Column(
                 children: [
                   Container(
                     margin: EdgeInsets.symmetric(horizontal: 16),
                     width: double.infinity,
                     child: MaterialButton(
                       color: Colors.white,
                       onPressed: () {
                         routeTo(RegisterPage.path);
                       }, child: Text("Get Started"),
                     ),
                   ),

                   Container(
                     child: MaterialButton(onPressed: () {
                       routeTo(LoginPage.path);
                     }, child: Text("Already have an account? Login", style: TextStyle(color: Colors.white),),
                     ),
                   ),
                 ],
               )
             ],
           ),
         ),
      ),
    );
  }
}
''';
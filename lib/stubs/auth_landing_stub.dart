/// AuthLandingPage stub
String stubAuthLanding() => '''
import 'package:flutter/material.dart';
import '/resources/widgets/logo_widget.dart';
import '/bootstrap/extensions.dart';
import '/resources/pages/login_page.dart';
import '/resources/pages/register_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AuthLandingPage extends NyStatefulWidget {
  static const path = '/auth-landing';

  AuthLandingPage() : super(path, child: _AuthLandingPageState());
}

class _AuthLandingPageState extends NyState<AuthLandingPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: "0045a0".toHexColor(),
        appBar: AppBar(
          leading: SizedBox.shrink(),
          backgroundColor: "acefff".toHexColor(),
          elevation: 0,
        ),
      body: SafeArea(
         child: Container(
           decoration: new BoxDecoration(
               gradient: new LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors: [
                   "acefff".toHexColor(),
                   "0045a0".toHexColor()
                 ],
               )),
           width: double.infinity,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [

               Container(
                 height: 125,
                 width: 200,
                 child: Logo(),
               ),

               Column(
                 children: [
                   Text("Let's get started").headingLarge(context).fontWeightBold().setColor(context, (color) => Colors.white),
                   Text("Try our new app").headingSmall(context).setColor(context, (color) => Colors.white),
                 ],
               ),

               Column(
                 children: [
                   Container(
                     margin: EdgeInsets.symmetric(horizontal: 16),
                     width: double.infinity,

                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.stretch,
                       children: [
                         MaterialButton(
                           padding: EdgeInsets.symmetric(vertical: 8),
                           color: Colors.white,
                           onPressed: () {
                             routeTo(RegisterPage.path);
                           }, child: Text("Get Started").bodyLarge(context),
                         ),

                         MaterialButton(
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                           onPressed: () {
                           routeTo(LoginPage.path);
                         }, child: Text("Already have an account? Login", style: TextStyle(color: Colors.white),),
                         ),
                       ],
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

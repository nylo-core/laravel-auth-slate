String stubDashboard() => '''
import 'package:flutter/material.dart';
import '/resources/pages/auth_landing_page.dart';
import '/app/events/logout_event.dart';
import '/app/models/auth_user.dart';
import '/app/networking/laravel_api_service.dart';
import '/bootstrap/extensions.dart';
import '/bootstrap/helpers.dart';
import '/app/controllers/controller.dart';
import 'package:nylo_framework/nylo_framework.dart';

class DashboardPage extends NyStatefulWidget {
  final Controller controller = Controller();
  
  static const path = '/dashboard';
  
  DashboardPage({Key? key}) : super(key: key);
  
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends NyState<DashboardPage> {

  AuthUser? _user;

  @override
  init() async {
    super.init();

  }

  @override
  boot() async {
    _user = await api<LaravelApiService>((request) => request.user());
  }
  
  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: "ebf0f4".toHexColor(),
      appBar: AppBar(
        title: Text("Dashboard").setColor(context, (color) => Colors.black),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SafeArea(
         child: afterLoad(child: () => Container(
           padding: EdgeInsets.all(16),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
             color: Colors.white
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Column(
                 children: [

                   Container(
                     margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                     padding: EdgeInsets.all(15),
                     decoration: BoxDecoration(
                         color: ThemeColor.get(context).background,
                         borderRadius: BorderRadius.circular(8),
                         boxShadow: [
                           BoxShadow(
                               color: Colors.grey.shade200,
                               spreadRadius: 0.1,
                               blurRadius: 20
                           )
                         ]),
                     child: Icon(Icons.key),
                   ),
                   Text("Logged in").headingMedium(context),
                   Divider(),
                   Text("Auth: \${_user?.email}"),
                 ],
               ),
               Container(
                 margin: EdgeInsets.only(top: 20),
                 width: double.infinity,
                 child: MaterialButton(
                   child: Text("Logout"), onPressed: () async {
                     event<LogoutEvent>();
                     routeTo(AuthLandingPage.path, navigationType: NavigationType.pushAndForgetAll);
                 },),
               )
             ],
           ),
         ),)
      ),
    );
  }
}
''';

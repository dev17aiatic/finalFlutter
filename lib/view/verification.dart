import 'package:app1/view/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app1/util/firebaseController.dart' as ControllerAuth;

class Verification_page extends StatefulWidget {
  @override
  _Verification_pageState createState() => _Verification_pageState();
}

class _Verification_pageState extends State<Verification_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'Verification',
          style: TextStyle(color: Colors.black26),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.favorite),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            'assets/img/BitLogo.png',
            alignment: Alignment.center,
            width: 140,
            height: 53,
            fit: BoxFit.contain,
          ),
          Text('Se ha enviado un emaiil de verificacion a tu correo',
              style: GoogleFonts.signika(
                  fontSize: 20,
                  color: Color(0xFF636363),
                  fontWeight: FontWeight.normal)),
          Center(
            child: AppButton(
              text: 'Verificar',
              onPressed: () {
                ControllerAuth.stateFirebase(context);
              },
            ),
          ),
          Center(
            child: AppButton(
              text: 'Enviar nuevamente correo',
              onPressed: () {
                ControllerAuth.sendVerifyEmail(context);
              },
            ),
          ),
          Center(
            child: AppButton(
              text: 'Log out',
              onPressed: () {
                ControllerAuth.signOut();
                ControllerAuth.stateFirebase(context);
              },
            ),
          ),
        ]),
      ),
    );
  }
}

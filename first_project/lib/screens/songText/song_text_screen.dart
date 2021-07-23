import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SongTextScreen extends StatefulWidget {
  SongTextScreen({Key? key}) : super(key: key);

  static const routeName = "/songTextScreen";

  @override
  _SongTextScreenState createState() => _SongTextScreenState();
}

class _SongTextScreenState extends State<SongTextScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Tekst")),
      ),
      body: Text(
        "$args",
        overflow: TextOverflow.visible,
        style: GoogleFonts.lato(
          fontSize: 20,
        ),
      ),
    );
  }
}

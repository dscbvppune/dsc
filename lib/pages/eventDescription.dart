import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'addEvent.dart';

class EventDescription extends StatefulWidget {
  final speaker, eventName, eventDate, eventTimings, registrationLink, desc, eventPosterURL, featured, venue;
  EventDescription({this.eventDate, this.eventName, this.eventTimings, this.registrationLink, this.speaker, this.desc, this.eventPosterURL, this.featured, this.venue});

  @override
  _EventDescriptionState createState() => _EventDescriptionState();
}

class _EventDescriptionState extends State<EventDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Event Details"
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: <Widget>[
            Image.network(
              widget.eventPosterURL,
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12
            ),
              child: Text(
                widget.eventName,
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              widget.eventDate + "  |  " + widget.eventTimings,
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  fontSize: 15
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 12
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Venue - " + widget.venue,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        fontSize: 15
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 12
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Speaker - " + widget.speaker,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        fontSize: 15
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 12
              ),
              child: Text(
                widget.desc,
                style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 15
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            RaisedButton.icon(
              onPressed: () async{
                var url = widget.registrationLink;
                if(await canLaunch(url)){
                  launch(url);
                }
              },
              icon: Icon(Icons.link),
              label: Text(
                "Registration Link"
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddEvent(
                pageTitle: "Edit Event",
                eventTime: widget.eventTimings,
                eventDate: widget.eventDate,
                eventDescription: widget.desc,
                eventSpeaker: widget.speaker,
                eventTitle: widget.eventName,
                eventURL: widget.registrationLink,
                eventPosterUrl: widget.eventPosterURL,
                featured: widget.featured,
                eventVenue: widget.venue,
              )
            )
          ).then((val){
            Navigator.pop(context);
          });
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Drawers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor:
            Colors.black, //This will change the drawer background to blue.
        //other styles
      ),
      child: new Drawer(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              leading: new Icon(Icons.info, color: Colors.white),
              title: Text(
                'Coming Soon',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.info, color: Colors.white),
              title: Text(
                '|',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.info, color: Colors.white),
              title: Text(
                '|',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.info, color: Colors.white),
              title: Text(
                '|',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.info, color: Colors.white),
              title: Text(
                '|',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.info, color: Colors.white),
              title: Text(
                '|',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.info, color: Colors.white),
              title: Text(
                '|',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.info, color: Colors.white),
              title: Text(
                '|',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.info, color: Colors.white),
              title: Text(
                '|',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.info, color: Colors.white),
              title: Text(
                '|',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.info, color: Colors.white),
              title: Text(
                '|',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.info, color: Colors.white),
              title: Text(
                '|',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.info, color: Colors.white),
              title: Text(
                '|',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.info, color: Colors.white),
              title: Text(
                '|',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.info, color: Colors.white),
              title: Text(
                'Coming Soon',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

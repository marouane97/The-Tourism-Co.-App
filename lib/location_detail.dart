import 'package:flutter/material.dart';
import 'models/location.dart';
import 'styles.dart';
import 'models/mocks/mock_location.dart';

class LocationDetail extends StatefulWidget {
  final int locationID;

  LocationDetail(this.locationID);

  @override
  createState() => _LocationDetailState(locationID);
}

class _LocationDetailState extends State<LocationDetail> {
  final int locationID;
  Location location = Location.blank();

  _LocationDetailState(this.locationID);

  @override
  void initState(){
    super.initState();
    loadData();
  }

  loadData() async{
    if(mounted){
      final location = await Location.fetchById(this.locationID);
      setState((){
        this.location = location;
      });
    }
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          location.name,
          style: Styles.navBarTitle
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context,location)
        ),
      )
    );
  }

  List<Widget> _renderBody(BuildContext context, Location location){
    var result = List<Widget>();
    result.add(_bannerImage(location.url, 170.0));
    result.addAll(_renderFacts(context, location));
    return result;
  }

  List<Widget> _renderFacts(BuildContext context, Location location){
    var result = List<Widget>();
    for(final locationFact in location.facts){
      result.add(_sectionTitle(locationFact.title));
      result.add(_sectionText(locationFact.text));
    }
    return result;
  }
  Widget _sectionTitle(String text){
    return Container(
      padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: Styles.headerLarge
      )
    );
  }
  Widget _sectionText(String text){
    return Container(
      padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
      child: Text(
        text,
        style: Styles.textDefault,
      )
    );
  }
  Widget _bannerImage(String url, double height){
    Image image;
    try{
      if(url.isNotEmpty){
        image = Image.network(url, fit:BoxFit.fitWidth);
      }
    }catch(e){
      print('could not load image from $url');
    }
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: image
    );
  }
  
}


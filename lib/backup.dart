import 'package:flighttickets/CustomShapeClipper.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

Color firstColor = Color(0xFFF47015);
Color secondColor = Color(0xFFEF772C);
ThemeData appTheme = ThemeData(
  primaryColor: Color(0xFFF3791A),
  fontFamily: 'Oxygen'
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight App',
      theme: appTheme,
      home: HomeScreen(),
    );
  }
}


List<String> locations = ['Hyderabad','Mumbai','Delhi'];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HomeScreenTop()
        ],
      ),
    );
  }
}



TextStyle dropDownLabelStyle = TextStyle(color: Colors.white,fontSize: 16.0);
TextStyle dropDownMenuStyle = TextStyle(color: Colors.black,fontSize: 16.0);
TextStyle viewAllStyle = TextStyle(color: appTheme.primaryColor,fontSize: 14.0);



class HomeScreenTop extends StatefulWidget {
  @override
  _HomeScreenTopState createState() => _HomeScreenTopState();
}

class _HomeScreenTopState extends State<HomeScreenTop> {

var selctedLocationIndex = 0;

var isFlightSelcted = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 320.0,
            decoration: BoxDecoration(gradient: LinearGradient(
              colors: [firstColor,secondColor],

            )),
            child: Column(
              children: <Widget>[
                SizedBox(height: 30.0,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.location_on, color:Colors.white),
                        SizedBox(width: 16.0,),
                        PopupMenuButton(
                          onSelected: (index){
                            setState(() {                                                          
                              selctedLocationIndex = index;
                              });
                            
                          },
                          child: Row(
                            children: <Widget>[
                              Text(locations[selctedLocationIndex], style:dropDownLabelStyle),
                              Icon(Icons.keyboard_arrow_down,color: Colors.white,)
                            ],
                          ),
                          itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                              PopupMenuItem(
                                child: Text(locations[0], style:dropDownMenuStyle),
                                value: 0,
                              ),
                              PopupMenuItem(
                                child: Text(locations[1], style:dropDownMenuStyle),
                                value: 1,
                              ),
                              PopupMenuItem(
                                child: Text(locations[2], style:dropDownMenuStyle),
                                value: 2,
                              ),

                            ],
                        ),
                        Spacer(),
                        Icon(Icons.settings, color:Colors.white)
                      ],
                    ),
                ),
                SizedBox(height: 10.0,),
                Text("Where would\n you want to go?", style:TextStyle(fontSize:24.0,color: Colors.white,),textAlign: TextAlign.center,),
                SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: TextField(
                      controller: TextEditingController(text:locations[0]),
                      style: dropDownMenuStyle,
                      cursorColor: appTheme.primaryColor,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 32.0,vertical: 14.0),
                        suffixIcon: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          child: Icon(
                            Icons.search,
                            color: Colors.black
                          ),
                        )
                      ),
                    ),
                  ),),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[ 
                      InkWell(
                        child: ChoiceChip(Icons.flight_takeoff,"Flights",isFlightSelcted),
                        onTap: (){
                          setState((){
                            isFlightSelcted = !isFlightSelcted;
                          });
                          
                        },
                        ),                      
                      SizedBox(width: 20.0,),
                      InkWell(
                        child: ChoiceChip(Icons.hotel,"Hotels",!isFlightSelcted),
                        onTap: (){
                          setState((){
                            isFlightSelcted = !isFlightSelcted;
                          });
                          
                        },
                        ),                      
                      
                    ],
                  )
              ],
            ),      
          ),

        )
      ],
    );

  }
}



class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  ChoiceChip(this.icon, this.text,this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}


class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            )
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20.0,
            color: Colors.white,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }
}

Widget homeScreenBottomPart = Container(
  
  child:Column(
  children: <Widget>[
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxirrRsAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // SizedBox(width: 16.0,),
          
          Text("Currently Watched items",style:dropDownMenuStyle),
          Text("View All(12)",style:viewAllStyle),
        ],
      ),
    ),
    Container(
      height: 210.0,
          child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(height: 210,width: 100.0,),
          Container(height: 210,),
          Container(height: 210,),
        ],
      ),
    )
  ],
  )
);

List<CityCard> cityCards =[
  CityCard("assets/images/lasvegas.jpg", "LaseVegas", "2016", "30%", "45", "49"),
  CityCard("assets/images/athens.jpg", "Athens", "2017", "35%", "54", "41"),
  CityCard("assets/images/sydney.jpeg", "LaseVegas", "2016", "30%", "42", "69"),
  
];

class CityCard extends StatelessWidget {
  final String imagePath,cityName,monthYear,discount,oldPrice,newPrice;

  CityCard(this.imagePath,this.cityName,this.monthYear,this.discount,this.oldPrice,this.newPrice);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(child: Image.asset("assets/images/"),)
    ],);
  }
}


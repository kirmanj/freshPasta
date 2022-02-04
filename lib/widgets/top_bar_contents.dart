import 'package:flutter/material.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;


  TopBarContents(this.opacity);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {

  var languageList = [
    'English',
    'کوردی',
    'حربی'
  ];
  var programs = [
    'Book Clube',
    'Qurantine',
  ];
  var activites = [
    'Environment',
    'Education',
    'Youth'
  ];
String _chosenValue= 'Language';
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
              left: screenSize.width * 0.05,
              right: screenSize.width * 0.05),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 70,
                child: Image.asset(
                  'assets/images/logowhite.png',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: screenSize.width / 25),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: Theme.of(context).highlightColor,
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    DropdownButton<String>(
                      underline: SizedBox(),
                      focusColor:Theme.of(context).highlightColor,
                      //value: _chosenValue,
                      //elevation: 5,
                      style: TextStyle(color: Colors.white),
                      iconEnabledColor:Theme.of(context).highlightColor,
                      items: programs.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style:TextStyle(color:Colors.black),),
                        );
                      }).toList(),
                      hint:Text(
                        "Programs",
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      onChanged: ( value) {
                        setState(() {
                          _chosenValue = value.toString();
                        });
                      },
                    ),
                    SizedBox(width: screenSize.width / 20),
                    DropdownButton<String>(
                      underline: SizedBox(),
                      focusColor:Colors.white,
                      //value: _chosenValue,
                      //elevation: 5,
                      style: TextStyle(color: Theme.of(context).highlightColor,),
                      iconEnabledColor:Theme.of(context).highlightColor,
                      items: activites.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style:TextStyle(color:Colors.black),),
                        );
                      }).toList(),
                      hint:Text(
                        "Activities",
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      onChanged: ( value) {
                        setState(() {
                          _chosenValue = value.toString();
                        });
                      },
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onTap: (){
                        setState(() {
                         // widget.selectedPage=2;
                        });
                      },
                      child: Text(
                        'Articles',
                        style: TextStyle(
                          color: Theme.of(context).highlightColor,
                        ),
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    Text(
                      'Volunteers form',
                      style: TextStyle(
                        color: Theme.of(context).highlightColor,
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    Text(
                      'Donates',
                      style: TextStyle(
                        color: Theme.of(context).highlightColor,
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    Text(
                      'About Us',
                      style: TextStyle(
                        color: Theme.of(context).highlightColor,
                      ),
                    ),
                  ],
                ),
              ),
              DropdownButton<String>(
                focusColor:Theme.of(context).highlightColor,
                //value: _chosenValue,
                //elevation: 5,
                style: TextStyle(color: Colors.white),
                iconEnabledColor:Theme.of(context).highlightColor,
                items: languageList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style:TextStyle(color:Colors.black),),
                  );
                }).toList(),
                hint:Text(

                  "Language",
                  style: TextStyle(
                      color: Theme.of(context).highlightColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                onChanged: ( value) {
                  setState(() {
                    _chosenValue = value.toString();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

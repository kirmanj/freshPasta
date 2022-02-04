import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explore/screens/about_us.dart';
import 'package:explore/screens/activities.dart';
import 'package:explore/screens/articls.dart';
import 'package:explore/screens/bookclub_screen.dart';
import 'package:explore/screens/donates.dart';
import 'package:explore/screens/home.dart';
import 'package:explore/screens/programs.dart';
import 'package:explore/screens/volunteer_form.dart';
import 'package:explore/widgets/responsive.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPage = 1;
  Color selectedPageColor = Color.fromRGBO(240, 178, 23, 1);
  Color unselectedPageColor = Color.fromRGBO(240, 178, 23, 0.5);
  var languageList = ['English', 'کوردی', 'حربی'];
  var programs = [
    'Book Clube',
    'Qurantine',
  ];
  var activites = ['Environment', 'Education', 'Youth'];
  String _chosenValue = 'Language';
  String _programChosenValue = '';
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        // appBar: ResponsiveWidget.isSmallScreen(context)
        //     ? AppBar(
        //   backgroundColor: Colors.blueGrey.shade900,
        //   elevation: 0,
        //   title: Text(
        //     'ZBARA',
        //     style: TextStyle(
        //       color: Colors.blueGrey.shade100,
        //       fontSize: 20,
        //       fontFamily: 'Montserrat',
        //       fontWeight: FontWeight.w400,
        //       letterSpacing: 3,
        //     ),
        //   ),
        // )
        //     : PreferredSize(
        //   preferredSize: Size(screenSize.width, 1000),
        //   child: Container(
        //     color: Colors.white,
        //     child: Padding(
        //       padding: EdgeInsets.only(
        //           top: 20,
        //           bottom: 20,
        //           left: screenSize.width * 0.05,
        //           right: screenSize.width * 0.05),
        //       child: Row(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Container(
        //             width: 100,
        //             height: 70,
        //             child: Image.asset(
        //               'assets/images/logowhite.png',
        //               fit: BoxFit.cover,
        //             ),
        //           ),
        //           Expanded(
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceAround,
        //               children: [
        //                 //SizedBox(width: screenSize.width / 25),
        //                 InkWell(
        //                   onTap: (){
        //                    setState(() {
        //                      _selectedPage=1;
        //                    });
        //                   },
        //                   child: Text(
        //                     'Home',
        //                     style: TextStyle(
        //                       fontWeight: _selectedPage==1? FontWeight.bold: FontWeight.normal,
        //                       color: _selectedPage==1?selectedPageColor:unselectedPageColor,
        //
        //                     ),
        //                   ),
        //                 ),
        //                // SizedBox(width: screenSize.width / 20),
        //                 DropdownButton<String>(
        //                   underline: SizedBox(),
        //                   focusColor:Theme.of(context).highlightColor,
        //                   //value: _chosenValue,
        //                   //elevation: 5,
        //                   style: TextStyle(color: Colors.white),
        //                   iconEnabledColor:Theme.of(context).highlightColor,
        //                   items: programs.map<DropdownMenuItem<String>>((String value) {
        //                     return DropdownMenuItem<String>(
        //                       value: value,
        //                       child: InkWell(
        //                           onTap: (){
        //                             print(value);
        //                             setState(() {
        //                               _selectedPage=21;
        //                             });
        //                           },
        //                           child: Text(value,style:TextStyle(color:Colors.black),)),
        //                     );
        //                   }).toList(),
        //                   hint:Text(
        //                     "Programs",
        //                     style: TextStyle(
        //                         fontWeight: _selectedPage==2? FontWeight.bold: FontWeight.normal,
        //                         color: selectedPageColor,
        //                         fontSize: 14,
        //                         ),
        //                   ),
        //                   onChanged: ( value) {
        //                     setState(() {
        //                       _programChosenValue = value.toString();
        //
        //                           if(_programChosenValue=='Qurantine'){
        //                             setState(() {
        //                               _selectedPage=2;
        //                             });
        //                           }
        //
        //                     });
        //                   },
        //                 ),
        //                // SizedBox(width: screenSize.width / 20),
        //                 DropdownButton<String>(
        //                   underline: SizedBox(),
        //                   focusColor:Colors.white,
        //                   //value: _chosenValue,
        //                   //elevation: 5,
        //                   style: TextStyle(color: Theme.of(context).highlightColor,),
        //                   iconEnabledColor:Theme.of(context).highlightColor,
        //                   items: activites.map<DropdownMenuItem<String>>((String value) {
        //                     return DropdownMenuItem<String>(
        //                       value: value,
        //                       child: Text(value,style:TextStyle(color:Colors.black),),
        //                     );
        //                   }).toList(),
        //                   hint:Text(
        //                     "Activities",
        //                     style: TextStyle(
        //                         color: Theme.of(context).highlightColor,
        //                         fontSize: 14,
        //                         fontWeight: FontWeight.w500),
        //                   ),
        //                   onChanged: ( value) {
        //                     setState(() {
        //                       _chosenValue = value.toString();
        //                     });
        //                   },
        //                 ),
        //                // SizedBox(width: screenSize.width / 20),
        //                 InkWell(
        //                   onTap: (){
        //                     setState(() {
        //                     _selectedPage=4;
        //                     });
        //                   },
        //                   child: Text(
        //                     'Articles',
        //                     style: TextStyle(
        //                       fontWeight: _selectedPage==4? FontWeight.bold: FontWeight.normal,
        //                       color: _selectedPage==4?selectedPageColor:unselectedPageColor,
        //                     ),
        //                   ),
        //                 ),
        //                // SizedBox(width: screenSize.width / 20),
        //                 InkWell(
        //                   onTap: (){
        //                     setState(() {
        //                       _selectedPage=5;
        //                     });
        //                   },
        //                   child: Text(
        //                     'Volunteers form',
        //                     style: TextStyle(
        //                       fontWeight: _selectedPage==5? FontWeight.bold: FontWeight.normal,
        //                       color: _selectedPage==5?selectedPageColor:unselectedPageColor,
        //                     ),
        //                   ),
        //                 ),
        //                // SizedBox(width: screenSize.width / 20),
        //                 InkWell(
        //                   onTap: (){
        //                     setState(() {
        //                       _selectedPage=6;
        //                     });
        //                   },
        //                   child: Text(
        //                     'Donates',
        //                     style: TextStyle(
        //                       fontWeight: _selectedPage==6? FontWeight.bold: FontWeight.normal,
        //                       color: _selectedPage==6?selectedPageColor:unselectedPageColor,
        //                     ),
        //                   ),
        //                 ),
        //               //  SizedBox(width: screenSize.width / 20),
        //                 InkWell(
        //                   onTap: (){
        //                     setState(() {
        //                       _selectedPage=7;
        //                     });
        //                   },
        //                   child: Text(
        //                     'About Us',
        //                     style: TextStyle(
        //                         fontWeight: _selectedPage==7? FontWeight.bold: FontWeight.normal,
        //                       color: _selectedPage==7 ? selectedPageColor:unselectedPageColor
        //                     ),
        //                   ),
        //                 ),
        //                 //SizedBox(width: screenSize.width / 20),
        //               ],
        //             ),
        //           ),
        //           DropdownButton<String>(
        //             focusColor:Theme.of(context).highlightColor,
        //             //value: _chosenValue,
        //             //elevation: 5,
        //             style: TextStyle(color: Colors.white),
        //             iconEnabledColor:Theme.of(context).highlightColor,
        //             items: languageList.map<DropdownMenuItem<String>>((String value) {
        //               return DropdownMenuItem<String>(
        //                 value: value,
        //                 child: Text(value,style:TextStyle(color:Colors.black),),
        //               );
        //             }).toList(),
        //             hint:Text(
        //
        //               "Language",
        //               style: TextStyle(
        //                   color: Theme.of(context).highlightColor,
        //                   fontSize: 14,
        //                   fontWeight: FontWeight.w500),
        //             ),
        //             onChanged: ( value) {
        //               setState(() {
        //                 _chosenValue = value.toString();
        //               });
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),

        body: SingleChildScrollView(
      child: Column(
        children: [
          ResponsiveWidget.isSmallScreen(context)
              ? AppBar(
                  backgroundColor: Theme.of(context).highlightColor,
                  elevation: 0,
                  title: Text(
                    'FRESH PASTA',
                    style: TextStyle(
                      color: Colors.blueGrey.shade100,
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 3,
                    ),
                  ),
                )
              : PreferredSize(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Stack(
                              children: [
                                Container(
                                  width: 75,
                                  height: 75,
                                  child: Image.asset(
                                    'assets/images/logowhite.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: width * 0.4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                //SizedBox(width: screenSize.width / 25),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedPage = 1;
                                    });
                                  },
                                  child: Text(
                                    'Home',
                                    style: TextStyle(
                                      fontWeight: _selectedPage == 1
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: _selectedPage == 1
                                          ? selectedPageColor
                                          : unselectedPageColor,
                                    ),
                                  ),
                                ),
                                // SizedBox(width: screenSize.width / 20),
                                // DropdownButton<String>(
                                //   underline: SizedBox(),
                                //   focusColor: Theme.of(context).highlightColor,
                                //   //value: _chosenValue,
                                //   //elevation: 5,
                                //   style: TextStyle(color: Colors.white),
                                //   iconEnabledColor: unselectedPageColor,
                                //   items: programs.map<DropdownMenuItem<String>>(
                                //       (String value) {
                                //     return DropdownMenuItem<String>(
                                //       value: value,
                                //       child: InkWell(
                                //           onTap: () {
                                //             print(value);
                                //             setState(() {
                                //               _selectedPage = 21;
                                //             });
                                //           },
                                //           child: Text(
                                //             value,
                                //             style:
                                //                 TextStyle(color: Colors.black),
                                //           )),
                                //     );
                                //   }).toList(),
                                //   hint: Text(
                                //     "Programs",
                                //     style: TextStyle(
                                //       fontWeight: _selectedPage == 2
                                //           ? FontWeight.bold
                                //           : FontWeight.normal,
                                //       color: unselectedPageColor,
                                //       fontSize: 14,
                                //     ),
                                //   ),
                                //   onChanged: (value) {
                                //     setState(() {
                                //       _programChosenValue = value.toString();

                                //       if (_programChosenValue == 'Qurantine') {
                                //         setState(() {
                                //           _selectedPage = 2;
                                //         });
                                //       }
                                //     });
                                //   },
                                // ),
                                // // SizedBox(width: screenSize.width / 20),
                                // DropdownButton<String>(
                                //   underline: SizedBox(),
                                //   focusColor: Colors.white,
                                //   //value: _chosenValue,
                                //   //elevation: 5,
                                //   style: TextStyle(
                                //     color: unselectedPageColor,
                                //   ),
                                //   iconEnabledColor:
                                //       Theme.of(context).highlightColor,
                                //   items: activites
                                //       .map<DropdownMenuItem<String>>(
                                //           (String value) {
                                //     return DropdownMenuItem<String>(
                                //       value: value,
                                //       child: Text(
                                //         value,
                                //         style: TextStyle(color: Colors.black),
                                //       ),
                                //     );
                                //   }).toList(),
                                //   hint: Text(
                                //     "Activities",
                                //     style: TextStyle(
                                //         color: unselectedPageColor,
                                //         fontSize: 14,
                                //         fontWeight: FontWeight.w500),
                                //   ),
                                //   onChanged: (value) {
                                //     setState(() {
                                //       _chosenValue = value.toString();
                                //     });
                                //   },
                                // ),
                                // // SizedBox(width: screenSize.width / 20),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedPage = 4;
                                    });
                                  },
                                  child: Text(
                                    'Articles',
                                    style: TextStyle(
                                      fontWeight: _selectedPage == 4
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: _selectedPage == 4
                                          ? selectedPageColor
                                          : unselectedPageColor,
                                    ),
                                  ),
                                ),
                                // SizedBox(width: screenSize.width / 20),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedPage = 5;
                                    });
                                  },
                                  child: Text(
                                    'Volunteers form',
                                    style: TextStyle(
                                      fontWeight: _selectedPage == 5
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: _selectedPage == 5
                                          ? selectedPageColor
                                          : unselectedPageColor,
                                    ),
                                  ),
                                ),
                                // SizedBox(width: screenSize.width / 20),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedPage = 6;
                                    });
                                  },
                                  child: Text(
                                    'Donates',
                                    style: TextStyle(
                                      fontWeight: _selectedPage == 6
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: _selectedPage == 6
                                          ? selectedPageColor
                                          : unselectedPageColor,
                                    ),
                                  ),
                                ),
                                //  SizedBox(width: screenSize.width / 20),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedPage = 7;
                                    });
                                  },
                                  child: Text(
                                    'About Us',
                                    style: TextStyle(
                                        fontWeight: _selectedPage == 7
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: _selectedPage == 7
                                            ? selectedPageColor
                                            : unselectedPageColor),
                                  ),
                                ),
                                //SizedBox(width: screenSize.width / 20),
                              ],
                            ),
                          ),
                          // DropdownButton<String>(
                          //   focusColor: Theme.of(context).highlightColor,
                          //   //value: _chosenValue,
                          //   //elevation: 5,
                          //   style: TextStyle(color: Colors.white),
                          //   iconEnabledColor: unselectedPageColor,
                          //   items: languageList
                          //       .map<DropdownMenuItem<String>>((String value) {
                          //     return DropdownMenuItem<String>(
                          //       value: value,
                          //       child: Text(
                          //         value,
                          //         style: TextStyle(color: Colors.black),
                          //       ),
                          //     );
                          //   }).toList(),
                          //   hint: Text(
                          //     "Language",
                          //     style: TextStyle(
                          //         color: unselectedPageColor,
                          //         fontSize: 14,
                          //         fontWeight: FontWeight.w500),
                          //   ),
                          //   onChanged: (value) {
                          //     setState(() {
                          //       _chosenValue = value.toString();
                          //     });
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
          ResponsiveWidget.isSmallScreen(context)
              ? Center(
                  child: Text('Mobile Version'),
                )
              : activePages()
        ],
      ),
    ));
  }

  Widget activePages() {
    switch (_selectedPage) {
      case 1:
        return HomeScreen();
        break;
      case 2:
        return ProgramsScreen();
        break;
      case 21:
        return BookClubScreen();
        break;
      case 3:
        return ActivitiesScreen();
        break;
      case 4:
        return ArticleScreen();
        break;
      case 5:
        return VolunteerScreen();
        break;
      case 6:
        return DonateScreen();
        break;
      case 7:
        return AboutUsScreen();
        break;
      default:
        return Container();
    }
  }
}

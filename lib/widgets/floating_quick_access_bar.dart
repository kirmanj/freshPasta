import 'package:explore/widgets/responsive.dart';
import 'package:flutter/material.dart';

class FloatingQuickAccessBar extends StatefulWidget {
  const FloatingQuickAccessBar({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _FloatingQuickAccessBarState createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {
  List _isHovering = [false, false, false];
  List<Widget> rowElements = [];

  List<int> itemNumber = [0, 0, 0];
  List<String> items = ['PROJECT', 'PEOPLE PROPPED  ', 'STUDENT'];
  List<IconData> icons = [
    Icons.work,
    Icons.person,
    Icons.book_sharp,
  ];

  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < items.length; i++) {
      Widget elementTile = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            value ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },
        onTap: () {},
        child: Text(
          "${itemNumber[i]}  " + items[i],
          style: TextStyle(
            color: _isHovering[i] ? Colors.blueGrey[900] : Colors.blueGrey,
          ),
        ),
      );
      Widget spacer = SizedBox(
        height: widget.screenSize.height / 20,
        child: VerticalDivider(
          width: 1,
          color: Colors.blueGrey[100],
          thickness: 1,
        ),
      );
      rowElements.add(elementTile);
      if (i < items.length - 1) {
        rowElements.add(spacer);
      }
    }

    return rowElements;
  }

  countUp() {
    for (int i = 0; i < 5000; i++) {
      Future.delayed(Duration(milliseconds: 1000), () {
        if (i < 24) {
          setState(() {
            itemNumber[0]++;
          });
        }
        if (i < 4590) {
          setState(() {
            itemNumber[2]++;
          });
        }
        if (i < 8320) {
          setState(() {
            itemNumber[1]++;
          });
        }
      });
    }
  }

  @override
  void initState() {
    countUp();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: widget.screenSize.height * 0.40,
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
        ),
        child: ResponsiveWidget.isSmallScreen(context)
            ? Column(
                children: [
                  ...Iterable<int>.generate(items.length).map(
                    (int pageIndex) => Padding(
                      padding:
                          EdgeInsets.only(top: widget.screenSize.height / 80),
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: widget.screenSize.height / 45,
                              bottom: widget.screenSize.height / 45,
                              left: widget.screenSize.width / 20),
                          child: Row(
                            children: [
                              Icon(
                                icons[pageIndex],
                                color: Colors.blueGrey,
                              ),
                              SizedBox(width: widget.screenSize.width / 20),
                              InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onTap: () {},
                                child: Text(
                                  items[pageIndex],
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox(height: 60,),
        // Card(
        //         elevation: 5,
        //         color: Theme.of(context).highlightColor,
        //         child: Padding(
        //           padding: EdgeInsets.only(
        //             top: widget.screenSize.height / 50,
        //             bottom: widget.screenSize.height / 50,
        //           ),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text(
        //                 itemNumber[0].toString(),
        //                 style: TextStyle(
        //                   color: Colors.white70,
        //                 ),
        //               ),
        //               Text(
        //                 "   " + items[0],
        //                 style: TextStyle(
        //                   color: Colors.white70,
        //                 ),
        //               ),
        //               Text(
        //                 "       |      ",
        //                 style: TextStyle(
        //                   color: Colors.white70,
        //                 ),
        //               ),
        //               Text(
        //                 itemNumber[1].toString(),
        //                 style: TextStyle(
        //                   color: Colors.white70,
        //                 ),
        //               ),
        //               Text(
        //                 "   " + items[1],
        //                 style: TextStyle(
        //                   color: Colors.white70,
        //                 ),
        //               ),
        //               Text(
        //                 "       |      ",
        //                 style: TextStyle(
        //                   color: Colors.white70,
        //                 ),
        //               ),
        //               Text(
        //                 itemNumber[2].toString(),
        //                 style: TextStyle(
        //                   color: Colors.white70,
        //                 ),
        //               ),
        //               Text(
        //                 "   " + items[2],
        //                 style: TextStyle(
        //                   color: Colors.white70,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
      ),
    );
  }
}

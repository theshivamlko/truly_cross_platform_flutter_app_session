import 'package:flutter/material.dart';

import 'Device.dart';

class MailItem extends StatelessWidget {
  final String sender;
  final String subject;
  final String msg;
  final String time;
  final bool hasFile;
  Device _device;

  MailItem({this.sender, this.subject, this.msg, this.time, this.hasFile});

  @override
  Widget build(BuildContext context) {
    _device = Device(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);

    return Container(
      margin: EdgeInsets.fromLTRB(30, 16, 16, 16),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSeyYPtNYsHIo3b1xFkNVmA9ENKHbwHmZPIuQ&usqp=CAU',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            this.sender,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'GoogleMedium'),
                          ),
                          Text(
                            this.time,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'GoogleRegular'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width:
                          _device.deviceWidth * (_device.isMobile ? 0.7 : 0.3),
                      child: Text(
                        this.subject,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'GoogleMedium'),
                      ),
                    ),
                    Container(
                      width:
                          _device.deviceWidth * (_device.isMobile ? 0.7 : 0.3),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              this.msg,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 16,
                                  fontFamily: 'GoogleMedium'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.star_outline,
                              color: Colors.grey[700],
                            ),
                          )
                        ],
                      ),
                    ),
                    this.hasFile
                        ? Container(
                            width: 140,
                            height: 35,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                              border:
                                  Border.all(color: Colors.grey[400], width: 1),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.sticky_note_2,
                                  color: Color(0xff1a73e8),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Yosemite Trip Document',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff1a73e8),
                                          fontFamily: 'GoogleMedium'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container()
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: Divider(),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'ClickCallback.dart';
import 'Device.dart';
import 'MaiItem.dart';
import 'MailDetailsWidget.dart';

class MailListWidget extends StatelessWidget {
  Device _device;

  ClickCallback onClick;

  MailListWidget({this.onClick});

  List emailItems = [
    {"sender": "Rajeev", "subject": "Your Trip to Australia"},
    {"sender": "Amazon", "subject": "You order has been delivered!"},
    {
      "sender": "IDFC Bank",
      "subject": "You acc. no XXXXXXXXXXXXX900 statement."
    },
    {"sender": "Rajeev", "subject": "Your work progress this month"},
    {"sender": "HR", "subject": "JOB- Flutter Developer Required"},
    {"sender": "Sam", "subject": "Congrats! You won \$10,000"},
  ];

  @override
  Widget build(BuildContext context) {
    _device = Device(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);

    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (_device.isMobile) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MailDetailsWidget(emailItems[index])),
                );
              } else {
                onClick(emailItems[index]);
              }
            },
            child: MailItem(
              sender: emailItems[index]["sender"],
              subject: emailItems[index]["subject"],
              time: "2:13 PM",
              hasFile: index % 3 == 0,
              msg:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting",
            ),
          );
        },
        itemCount: emailItems.length,
      ),
    );
  }
}

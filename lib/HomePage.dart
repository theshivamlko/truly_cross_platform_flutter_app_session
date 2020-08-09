import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sampleapp/MailDetailsWidget.dart';

import 'Device.dart';
import 'MailListWidget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  Device _device;
  Widget _mailDetailsPage = Container();

  @override
  Widget build(BuildContext context) {
    _device = Device(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width,
        isWeb: kIsWeb, isDesktop: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.grey[700],
          ),
          onPressed: () {},
        ),
        elevation: 0,
      ),
      body: getMainView(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget getMainView() {
    return _device.isMobile
        ? MailListWidget()
        : Row(
            children: [
              Expanded(
                flex: 2,
                child: MailListWidget(
                  onClick: (mail) {
                    _mailDetailsPage = MailDetailsWidget(mail);
                    setState(() {});
                  },
                ),
              ),
              Expanded(flex: 3, child: _mailDetailsPage)
            ],
          );
  }
}

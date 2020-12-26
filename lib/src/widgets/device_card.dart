import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class CardHolder extends StatelessWidget {
  final TextStyle sceneFont = TextStyle(
      fontSize: 14,
      color: Colors.white,
      letterSpacing: 1.5,
      fontWeight: FontWeight.w600);
  final TextStyle seeAllFont = TextStyle(
      fontSize: 14,
      color: Colors.blue[400],
      letterSpacing: 1.5,
      fontWeight: FontWeight.w300);

  final String sceneName;
  CardHolder(this.sceneName);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DeviceCardActivationModel(),
      child: Column(
        children: [
          SceneTitle(
              sceneFont: sceneFont,
              seeAllFont: seeAllFont,
              sceneName: sceneName),
          Wrap(
            children: [
              DeviceCard(Icons.star, "Living room lamp"),
              DeviceCard(Icons.stacked_bar_chart, "Living room tv"),
              DeviceCard(
                  Icons.notification_important_rounded, "Living room outlet"),
              DeviceCard(Icons.bookmark, "Living room fan"),
              DeviceCard(Icons.home, "Living room fridge"),
              DeviceCard(Icons.signal_cellular_4_bar, "Living room Radio"),
            ],
          ),
        ],
      ),
    );
  }
}

class SceneTitle extends StatelessWidget {
  const SceneTitle({
    Key key,
    @required this.sceneFont,
    @required this.seeAllFont,
    @required this.sceneName,
  }) : super(key: key);

  final TextStyle sceneFont;
  final TextStyle seeAllFont;
  final String sceneName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15.0, top: 50.0),
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(sceneName, style: sceneFont),
          )),
          FlatButton(
            child: Text("See all", style: seeAllFont),
            onPressed: () {
              print("See all");
            },
          ),
        ],
      ),
    );
  }
}

class DeviceCard extends StatelessWidget {
  final IconData iconDevice;
  final String deviceName;
  DeviceCard(this.iconDevice, this.deviceName);
  @override
  Widget build(BuildContext context) {
    var localDeviceNames = [];
    var deviceStates = Provider.of<DeviceCardActivationModel>(context);
    return GestureDetector(
      onTap: () {
        localDeviceNames = deviceStates.states;
        if (localDeviceNames.contains(deviceName)) {
          localDeviceNames.remove(deviceName);
        } else {
           localDeviceNames.add(deviceName);
        }
        deviceStates.states = localDeviceNames;
      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: deviceStates.states.contains(deviceName)
              ? Colors.white
              :Color.fromRGBO(168, 176, 179, 0.2), 
        ),
        height: 120,
        width: 100,
        child: DeviceCardContent(iconDevice, deviceName),
      ),
    );
  }
}

class DeviceCardContent extends StatelessWidget {
  final TextStyle deviceCardNameFontOff = TextStyle(
      fontSize: 14,
      color: Colors.white,
      letterSpacing: 1.5,
      fontWeight: FontWeight.w300);
  final TextStyle deviceCardNameFontOn = TextStyle(
      fontSize: 14,
      color: Colors.black,
      letterSpacing: 1.5,
      fontWeight: FontWeight.w300);
  final TextStyle deviceCardStateOff = TextStyle(
      fontSize: 14,
      color: Colors.blueGrey,
      letterSpacing: 1.5,
      fontWeight: FontWeight.w500);

  final TextStyle deviceCardStateOn = TextStyle(
      fontSize: 14,
      color: Colors.black,
      letterSpacing: 1.5,
      fontWeight: FontWeight.w500);

  final IconData iconDevice;
  final String deviceName;
  DeviceCardContent(this.iconDevice, this.deviceName);

  @override
  Widget build(BuildContext context) {
    var deviceStates = Provider.of<DeviceCardActivationModel>(context, listen: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          iconDevice,
          color:  deviceStates.states.contains(deviceName) ? Colors.amber : Colors.blue[700] ,
          size: 30,
        ),
        Container(
          margin:
              EdgeInsets.only(bottom: 5.0, top: 10.0, left: 0.0, right: 0.0),
          child: Text(
            deviceName,
            style: deviceStates.states.contains(deviceName) ? deviceCardNameFontOn : deviceCardNameFontOff
          ),
        ),
        Container(
          child: Text(
            deviceStates.states.contains(deviceName) ? "On" : "Off",
            style: deviceStates.states.contains(deviceName) ? deviceCardStateOn : deviceCardStateOff,
          ),
        ),
      ],
    );
  }
}

class SquareGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) => new Container(
          color: Colors.green,
          child: new Center(
            child: new CircleAvatar(
              backgroundColor: Colors.white,
              child: new Text('$index'),
            ),
          )),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class DeviceCardActivationModel extends ChangeNotifier {  
  List<String> _states = [];

  List<String> get states => _states;

  set states(List<String> states) {
    _states = states;
    notifyListeners();
  }
}
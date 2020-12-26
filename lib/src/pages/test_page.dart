import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestPage extends StatelessWidget {
  static final String routeName = "testPage";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _Navegation(),
      child: Scaffold(
        body: PageView(
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.blue,
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(),
      ),
    );
  }
}

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<_Navegation>(context);
    return BottomNavigationBar(
      currentIndex: navigation.page,
      onTap: (i){
        navigation.page = i;
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "op1",
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.sensor_window),
          label: "op2",
        )
      ],
    );
  }
}

class _Navegation extends ChangeNotifier {
  int _page = 0;

  int get page => _page;
  set page(int page) {
    _page = page;
    notifyListeners();
  }
}

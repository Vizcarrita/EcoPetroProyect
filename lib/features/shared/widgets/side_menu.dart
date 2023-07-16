import 'package:flutter/material.dart';
import 'package:example_ecopetro/features/shared/widgets/widgets.dart';

import '../../trucks/presentation/screens/screens.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  final List<Widget> _destinationWidgets = [const RegisterScreen()];

  void _onDestinationSelected(int index) {
    setState(() {
      navDrawerIndex = index;
    });

    widget.scaffoldKey.currentState?.openEndDrawer();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _destinationWidgets[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      elevation: 1,
      selectedIndex: navDrawerIndex,
      onDestinationSelected: _onDestinationSelected,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, hasNotch ? 0 : 20, 16, 0),
          child: const Text('Saludos'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 16, 10),
          child: Text('Test User'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.place),
          label: Text('Mis viajes'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('Otras opciones'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomFilledButton(onPressed: () {}, text: 'Cerrar sesión'),
        ),
      ],
    );
  }
}

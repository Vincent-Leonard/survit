part of 'widgets.dart';

class BottomNavigationSurvit extends StatefulWidget {
  const BottomNavigationSurvit({Key? key}) : super(key: key);

  @override
  _BottomNavigationSurvitState createState() => _BottomNavigationSurvitState();
}

class _BottomNavigationSurvitState extends State<BottomNavigationSurvit> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? new SvgPicture.asset('assets/icons/home.svg')
                  : new SvgPicture.asset('assets/icons/home_colored.svg'))
        ],
      ),
    );
  }
}

part of 'widgets.dart';

class BottomNavigationSurvit extends StatefulWidget {
  const BottomNavigationSurvit({Key? key}) : super(key: key);

  @override
  _BottomNavigationSurvitState createState() => _BottomNavigationSurvitState();
}

class _BottomNavigationSurvitState extends State<BottomNavigationSurvit> {
  int _selectedIndex = 0;

  final screens = [
    const Home(),
    const Survey(),
    const Point(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? const Icon(Icons.home)
                  : const Icon(
                      Icons.home_filled,
                      color: Colors.blue,
                    )),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? const Icon(Icons.add)
                  : const Icon(
                      Icons.add,
                      color: Colors.blue,
                    )),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

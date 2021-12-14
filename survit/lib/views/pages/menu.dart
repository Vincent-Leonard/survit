part of 'pages.dart';

class Menu extends StatefulWidget {
  static const String routeName = "/Menu";
  @override
  _Menu createState() => _Menu();
}

class _Menu extends State<Menu> {
  int _selectedIndex = 0;

  final page = [
    const Home(),
    const Survey(),
    const Point(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: const [
          Icons.home,
          Icons.list,
          Icons.money,
          Icons.account_circle_outlined,
        ],
        onChange: (val) {
          setState(() {
            _selectedIndex = val;
          });
        },
        defaultSelectedIndex: 0,
      ),
      body: Center(child: page.elementAt(_selectedIndex)),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      required this.iconList,
      required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: index == _selectedIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 4, color: Color.fromRGBO(0, 122, 255, 1)),
                ),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(0, 122, 255, 0.3),
                  Color.fromRGBO(0, 122, 255, 0.015),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
                // color: index == _selectedItemIndex ? Colors.green : Colors.white,
                )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedIndex
              ? Color.fromRGBO(0, 122, 255, 1)
              : Colors.grey,
        ),
      ),
    );
  }
}

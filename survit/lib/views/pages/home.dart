part of 'pages.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String routeName = "Home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                // color: Colors.red,
                height: 200,
                padding: const EdgeInsets.all(30),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: mainBGColor,
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(0, 122, 255, 1),
                              Color.fromRGBO(0, 122, 255, 0.3),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    height: 120,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(top: 25, left: 20),
                                child: Text(
                                  "Hello!",
                                  style: new TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(top: 4, left: 20),
                                child: Text(
                                  "Ardian Kurniawan",
                                  style: new TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 40),
                            child: Text(
                              "10900",
                              style: new TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 0, left: 40),
                child: Text(
                  "Survey List",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SurveyDetail.routeName);
                },
                child: const Text(
                  'Test Survey',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

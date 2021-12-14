part of 'pages.dart';

class SurveyDetail extends StatefulWidget {
  const SurveyDetail({Key? key}) : super(key: key);
  static const String routeName = "Survey_Detail";

  @override
  _SurveyDetailState createState() => _SurveyDetailState();
}

class _SurveyDetailState extends State<SurveyDetail> {
  late InAppWebViewController controller;
  String url =
      "https://docs.google.com/forms/d/e/1FAIpQLSeH08ircWgKalP3Y6iAuVE15sGcihIebcDBFzGwcCq0oCa-6g/viewform?usp=sf_link";
  double progress = 0;
  final bool debuggingEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, Menu.routeName);
                },
                child: const Text(
                  'Back',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                child: progress < 1.0
                    ? LinearProgressIndicator(
                        value: progress,
                      )
                    : Container()),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: InAppWebView(
                  initialUrlRequest: URLRequest(url: Uri.parse(url)),
                  initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions()),
                  onWebViewCreated: (webViewController) =>
                      controller = webViewController,
                  onLoadStart: (controller, url) {
                    setState(() {
                      this.url = url as String;
                    });
                  },
                  onLoadStop: (controller, url) {
                    setState(() {
                      this.url = url as String;
                    });
                  },
                  onProgressChanged: (controller, progress) {
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

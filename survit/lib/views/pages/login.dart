part of 'pages.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const String routeName = "Login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isVisible = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: mainBGColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 86.0,
              ),
              Container(
                child: Image.asset(logoSurvit1),
                height: 70,
              ),
              const SizedBox(
                height: 86.0,
              ),
              Container(
                height: 440,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      "Sign In",
                      style: new TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: TextFormField(
                              controller: ctrlEmail,
                              keyboardType: TextInputType.emailAddress,
                              scrollPadding: EdgeInsets.only(bottom: 70),
                              decoration: InputDecoration(
                                labelText: "mail@website.com",
                                prefixIcon:
                                    const Icon(Icons.mail_outline_rounded),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.grey[100],
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null) {
                                  return "Please fill email address";
                                } else {
                                  if (!EmailValidator.validate(value)) {
                                    return "Email is not valid";
                                  } else {
                                    return null;
                                  }
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Password",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: TextFormField(
                              scrollPadding: const EdgeInsets.only(bottom: 40),
                              controller: ctrlPass,
                              obscureText: isVisible,
                              decoration: InputDecoration(
                                  labelText: "Min. 6 Character",
                                  prefixIcon: const Icon(Icons.vpn_key),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                    child: Icon(isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  )),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                return value!.length < 6
                                    ? "Password must have at least 6 character"
                                    : null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 70),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Register.routeName);
                                  },
                                  child: const Text(
                                    'Don\'t have an account?',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 14),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                              }
                            },
                            icon: const Icon(Icons.login_rounded),
                            label: const Text("Sign In"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue, elevation: 0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

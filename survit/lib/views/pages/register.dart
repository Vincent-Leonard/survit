part of 'pages.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static const String routeName = "Register";

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                height: 40.0,
              ),
              Container(
                child: Image.asset(logoSurvit1),
                height: 70,
              ),
              const SizedBox(
                height: 40.0,
              ),
              Container(
                height: 580,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Register",
                      style: new TextStyle(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              scrollPadding: EdgeInsets.only(bottom: 40),
                              decoration: InputDecoration(
                                labelText: "First Name",
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              scrollPadding: EdgeInsets.only(bottom: 80),
                              decoration: InputDecoration(
                                labelText: "Last Name",
                                prefixIcon: const Icon(Icons.person_outline),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: ctrlEmail,
                              keyboardType: TextInputType.emailAddress,
                              scrollPadding: EdgeInsets.only(bottom: 80),
                              decoration: InputDecoration(
                                labelText: "Email",
                                prefixIcon:
                                    const Icon(Icons.mail_outline_rounded),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              scrollPadding: EdgeInsets.only(bottom: 40),
                              decoration: InputDecoration(
                                labelText: "Phone Number",
                                prefixIcon: const Icon(Icons.call),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              scrollPadding: EdgeInsets.only(bottom: 40),
                              controller: ctrlPass,
                              obscureText: isVisible,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  prefixIcon: const Icon(Icons.vpn_key),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
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
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context, Login.routeName);
                            },
                            child: const Text(
                              'Already Have an Account?',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                Navigator.pushReplacementNamed(
                                    context, Login.routeName);
                              }
                            },
                            icon: const Icon(Icons.login_rounded),
                            label: const Text("Register"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue, elevation: 0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

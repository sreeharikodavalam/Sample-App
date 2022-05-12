import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moovebe/api/api_auth.dart';
import 'package:moovebe/screens/home_screen.dart';
import 'package:moovebe/utils.dart';
import 'package:moovebe/widgets/app_buttons.dart';
import 'package:moovebe/widgets/loading_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  _setLoadingState(status)=> setState(()=>isLoading = status);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * .7,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/background_trian.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0, bottom: 24),
                        child: Column(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: const [
                          Text(
                            "Welcome",
                            style: TextStyle(fontSize: 44, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Manage your Bus and Drivers",
                            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),

                    if(!isLoading)
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: TextFormField(
                        controller: _controllerUsername,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Username',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                      ),
                    ),
                    if(!isLoading)
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: TextFormField(
                        controller: _controllerPassword,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Password',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            if(!isLoading)
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 4),
              child: AppButtonLarge(
                text: "Login",
                onButtonClick: () {
                  if (_formKey.currentState!.validate()) {
                    _startLoginFlow();
                  }
                },
                isPrimary: true,
              ),
            ),
            if(isLoading)
              LoadingBody()
          ],
        ),
      ),
    );
  }

  _startLoginFlow() {
    _setLoadingState(true);
    String password = _controllerPassword.text;
    String username = _controllerUsername.text;
    ApiAuth.login(password: password, username: username)
        .then((value) {
          if(value){
            pushReplaceScreen(context, const HomeScreen());
          } else {
            _setLoadingState(false);
            customDialog(context: context, title: "Login error", description: "Incorrect password or username");
          }
    })
        .onError((error, stackTrace) {
      customDialog(context: context, title: "Login error", description: "Incorrect password or username");
      _setLoadingState(false);
    });
  }
}

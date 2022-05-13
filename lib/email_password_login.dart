import 'package:flutter/material.dart';
import 'constants.dart';

class EmailLogIn extends StatefulWidget {
  const EmailLogIn({Key? key}) : super(key: key);

  @override
  State<EmailLogIn> createState() => _EmailLogInState();
}

class _EmailLogInState extends State<EmailLogIn> {
  //form key
  final _formkey = GlobalKey<FormState>();

  //editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {

    final emailField = TextFormField(
        style: const TextStyle(color: white),
        controller: emailController,
        autofocus: false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: white,
              width: 2.0,
            ),
          ),
          fillColor: Colors.black,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email/Phone Number",
          hintStyle: const TextStyle(
              fontFamily: "myFont", color: hintText, fontSize: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please enter your Email");
          }
          //reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+[a-z]")
              .hasMatch(value)) {
            return ("Please enter a valid Email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next); //Email field

    final passwordField = TextFormField(
        style: const TextStyle(color: white),
        controller: passwordController,
        obscureText: !_passwordVisible,
        autofocus: false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: white,
              width: 2.0,
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: hintText),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          fillColor: Colors.black,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          hintStyle: const TextStyle(
              fontFamily: "myFont", color: hintText, fontSize: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: white)),
        ),
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Please enter your password");
          }
          if (!regex.hasMatch(value)) {
            return ("Please enter a valid password (min 6 char)");
          }
          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done); //Password

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(height: 65),
                const BoldText("Get Started", 38, blue),
                const SizedBox(height: 25),
                const PlainText(
                    "Before you are using this app, please", 21, white),
                const SizedBox(height: 5),
                const PlainText("sign in to continue first", 21, white),
                const SizedBox(height: 50),
                emailField,
                const SizedBox(height: 20),
                passwordField,
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: const BoldText("Help!", 18, white),
                      onTap: () {},
                    ),
                    const SizedBox(width: 60),
                    GestureDetector(
                      child: const BoldText("Forgot your Password?", 18, white),
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                MaterialButton(
                  elevation: 0,
                  color: yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    if(_formkey.currentState!.validate());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: const [
                        Spacer(),
                        BoldText("Log In", 20, Colors.black),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const PlainText("Didn't have any Account?", 18, white),
                    const SizedBox(width: 15),
                    GestureDetector(
                      child: const BoldText("Sign Up Now", 18, blue),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nest_reels/constants.dart';
import 'package:nest_reels/views/screens/auth/auths.dart';
import 'package:nest_reels/views/widgets/widgets.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController= TextEditingController();

  final TextEditingController emailController= TextEditingController();

  final TextEditingController passwordController= TextEditingController();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Tiktok Clone', style: TextStyle(fontSize: 30, color: buttonColor, fontWeight: FontWeight.w900),),
                  const Text('SignUp', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                  const SizedBox(height: 15,),
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 64,
                          foregroundImage: AssetImage("assets/images/logo.png")
                      ),
                      Positioned(
                        bottom: -10,
                          left: 80,
                          child: IconButton(
                            icon: const Icon(Icons.add_a_photo),
                            onPressed: () => authController.pickImage(),
                          ))
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                      padding: const EdgeInsets.only(top: 5, right: 25, bottom: 2, left: 25),
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: usernameController,
                          decoration: InputDecoration(
                            label: const Text('Username', style: TextStyle(fontSize: 15, ),),
                            prefixIcon: const Icon(FontAwesomeIcons.envelope, size: 20,),
                            hintText: "  Username",
                            //hintStyle: const TextStyle(color: Palette.nestBlue),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: borderColor,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: borderColor,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                      padding: const EdgeInsets.only(top: 5, right: 25, bottom: 2, left: 25),
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: emailController,
                          decoration: InputDecoration(
                            label: const Text('Email', style: TextStyle(fontSize: 15, ),),
                            prefixIcon: const Icon(FontAwesomeIcons.envelope, size: 20,),
                            hintText: "  Email",
                            //hintStyle: const TextStyle(color: Palette.nestBlue),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: borderColor,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: borderColor,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 25, bottom: 2, left: 25),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: passwordController,
                      obscureText: !isVisible,
                      //validator: (val) => val?.length! < 5 ? 'Use at least 5 characters' : null,
                      decoration: InputDecoration(
                        label: const Text('Password', style: TextStyle(fontSize: 15,),),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                        ),
                        prefixIcon: const Icon(FontAwesomeIcons.lock, size: 20,),
                        hintText: "  Password",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:  const BorderSide(
                            color: borderColor,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: borderColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: InkWell(
                        onTap: () => authController.registerUser(
                            usernameController.text,
                            emailController.text,
                            passwordController.text,
                            authController.profilePhoto),
                        child: const Center(child: Text('Register', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),))),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? ', style: TextStyle(fontSize: 15),),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen(),),);
                        },
                        child: Text('Login', style: TextStyle(fontSize: 15, color: buttonColor),),
                      )
                    ],
                  )

                ],
              ),
            ),
          )),
    );
  }
}

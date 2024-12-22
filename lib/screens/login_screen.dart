import 'package:bookhive/helper/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:bookhive/screens/main_screen.dart'; 

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: const AssetImage("assets/images/loginBackground.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              const Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image(
                    image: AssetImage("assets/images/BookHive2.png"),
                    width: 250.0,
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: mediaSize.width,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Welcome!",
                              style: TextStyle(
                                fontSize: 32,
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              "Please login with your information",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 40),
                            const Text(
                              "Email Address:",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            _buildInputField(emailController),
                            const SizedBox(height: 40),
                            const Text(
                              "Password:",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            _buildInputField(passwordController,
                                isPassword: true),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: rememberUser,
                                        onChanged: (value) {
                                          setState(() {
                                            rememberUser = value!;
                                          });
                                        },
                                        activeColor: AppColors.mainColor,
                                        side: const BorderSide(
                                          color: AppColors.mainColor,
                                        ), 
                                    ),
                                    const Text("Remember me",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.mainColor,
                                      )
                                    ),
                                  ],
                                ),
                                TextButton(onPressed: (){}, child: const Text("Forgot Password?",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.mainColor,
                                  )
                                )),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()),);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainColor,
                                shape: const StadiumBorder(),
                                elevation: 20,
                                shadowColor: AppColors.mainColor,
                                minimumSize: const Size.fromHeight(60),
                              ),
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: Column(
                                children: [
                                  const Text("Or Login With",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Tab(icon: Image.asset("assets/images/google.webp", width: 40, height: 40)),
                                      Tab(icon: Image.asset("assets/images/facebook.png", width: 40, height: 40)),
                                      Tab(icon: Image.asset("assets/images/x.png", width: 40, height: 40)),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? const Icon(Icons.remove_red_eye, color: AppColors.mainColor) : const Icon(Icons.email, color: AppColors.mainColor),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor), // Focused line color
        ),
      ),
      obscureText: isPassword,
    );
  }
}

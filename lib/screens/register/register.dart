import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gesturb/global/colors.dart';
import 'package:gesturb/methods/common_methods.dart';
import 'package:gesturb/models/requests/Register_request.dart';
import 'package:gesturb/providers/auth_provider.dart';
import 'package:gesturb/utils/title.dart';

class Register extends StatefulWidget {
  const Register({Key? key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController prenomController;
  late TextEditingController nomController;
  late TextEditingController addressController;
  late TextEditingController communeController;
  late TextEditingController phoneController;


  bool isactive = false;
  bool isPasswordVisible = false;
  final CommonMethods commonMethods = CommonMethods();

  @override
  void initState() {
    super.initState();
    // role = 2;
    emailController = TextEditingController();
    passwordController = TextEditingController();
    prenomController = TextEditingController();
    nomController = TextEditingController();
    addressController = TextEditingController();
    communeController = TextEditingController();
    phoneController = TextEditingController();

    emailController.addListener(updateActiveState);
    passwordController.addListener(updateActiveState);
    prenomController.addListener(updateActiveState);
    nomController.addListener(updateActiveState);
    addressController.addListener(updateActiveState);
    communeController.addListener(updateActiveState);
    phoneController.addListener(updateActiveState);


  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    prenomController.dispose();
    nomController.dispose();
    communeController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  /* void updateActiveState() {
    final isActive = emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        prenomController.text.isNotEmpty &&
        nomController.text.isNotEmpty &&
        communeController.text.isEmpty &&
        addressController.text.isEmpty &&
        phoneController.text.isNotEmpty; // Added condition for phoneController
    setState(() {
      isactive = isActive;
    });
  }
 */
void updateActiveState() {
    final isActive = emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        prenomController.text.isNotEmpty &&
        nomController.text.isNotEmpty &&
        phoneController.text
            .isNotEmpty; 
    setState(() {
      isactive = isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*  Register() {
      final ap = Provider.of<AuthProvider>(context, listen: false);
      RegisterRequest RegisterRequest = RegisterRequest(
          email: emailController.text, password: passwordController.text);
      var result = ap.RegisterProvider(RegisterRequest, context);
      return result;
    } */

    checkConnectivity() {
      commonMethods.checkConnectivity(context);
      // Register();
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 240, 252, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              TitleText(
                  data: 'Créer son compte',
                  color: Colors.black,
                  size: 26,
                  weight: FontWeight.w800,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  fontFamily: 'Poppins'),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                child: TextField(
                  controller: nomController,
                  onChanged: (value) {
                    updateActiveState();
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Nom',
                    labelStyle: TextStyle(color: Colors.black38),
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    /* border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 3.0,
                      ),
                    ), */
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: TextField(
                  controller: prenomController,
                  onChanged: (value) {
                    updateActiveState();
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Prenom',
                    labelStyle: TextStyle(color: Colors.black38),
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: TextField(
                  controller: addressController,
                  onChanged: (value) {
                    updateActiveState();
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.pin),
                    hintText: 'Address',
                    labelStyle: TextStyle(color: Colors.black38),
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
               const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: TextField(
                  controller: communeController,
                  onChanged: (value) {
                    updateActiveState();
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.pin),
                    hintText: 'Address',
                    labelStyle: TextStyle(color: Colors.black38),
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 40,
                  child: TextField(
                    controller: passwordController,
                    onChanged: (value) {
                      updateActiveState();
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'Mot depasse',

                      // labelText: "Password",
                      fillColor: Colors.grey,
                      focusColor: Colors.grey,
                      /* border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 3.0,
                        ),
                      ), */
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    obscureText: !isPasswordVisible,
                    keyboardType: TextInputType.visiblePassword,
                  )),
                const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: TextField(
                  controller: phoneController,
                  onChanged: (value) {
                    updateActiveState();
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    hintText: 'Numéro de téléphone',
                    labelStyle: TextStyle(color: Colors.black38),
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: TextField(
                  controller: emailController,
                  onChanged: (value) {
                    updateActiveState();
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'anadearmas@gmail.com',
                    labelStyle: TextStyle(color: Colors.black38),
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle the action when the user presses "Forgot password"
                  print('Forgot password');
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: AppColors.myColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              
             /*  SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  color: Color.fromARGB(249, 245, 243, 243),
                  height: 48,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'images/googleLogo.png',
                        width: 20,
                      ),
                      TitleText(
                        data: 'Sign in with Google',
                        color: Colors.black,
                        size: 16,
                        weight: FontWeight.normal,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        fontFamily: 'Inter',
                      ),
                    ],
                  ),
                ),
              ), */
             /*  SizedBox(
                height: 100,
              ), 
              */

               TitleText(
                data: 'En vous inscrivant, vous acceptez nos termes et conditions et Politique de confidentialité',
                color: Colors.black,
                size: 12,
                weight: FontWeight.normal,
                maxLines: 1,
                overflow: TextOverflow.clip,
                fontFamily: 'Inter',
              ),
              
              Align(
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleText(
                      data: 'Vous avez déja un compte ?',
                      color: Colors.black,
                      size: 12,
                      weight: FontWeight.normal,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      fontFamily: 'Inter',
                    ),
                    TextButton(
                      onPressed: () {
                        /*  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register())); */
                      },
                      child:  TitleText(
                      data: 'je me connecte',
                      color: AppColors.vert,
                      size: 12,
                      weight: FontWeight.normal,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      fontFamily: 'Inter',
                    ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: isactive
                    ? () {
                        checkConnectivity();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  //onSurface: AppColors.myColor,
                  backgroundColor: AppColors.vert,
                ),
                child: Container(
                  width: 400,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container greyLine(double valMargin) {
    return Container(
      width: 133,
      height: 1,
      color: const Color(0xFFD9D9D9),
      margin: EdgeInsets.only(left: valMargin),
    );
  }
}

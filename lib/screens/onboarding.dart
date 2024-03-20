import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gesturb/global/colors.dart';
import 'package:gesturb/screens/login/login.dart';
import 'package:gesturb/screens/register/register.dart';
import 'package:gesturb/utils/titleoption.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gesturb/models/page_model.dart';



class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  final List<PageModel> pages = [
    PageModel(
      backgroundImage: 'images/on1.png',
      title: 'Créer votre compte en toute sécurité',
      description:
          'Complete your profile to help you find a roommate who will be right for you.',
    ),
    PageModel(
      backgroundImage: 'images/onb2.png',
      title: 'Rejoignez notre grande famille',
      description:
          'Choose to live with people who match your preferences',
    ),
    PageModel(
      backgroundImage: 'images/onb3.png',
      title: 'Connectez vous à votre commune',
      description:
          'Talk to your Roommate, know each other and make decision together',
    ),
  ];
  int currentIndex = 0;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          height: height,
          width: width,
          //color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: (currentIndex != pages.length - 1) ?
              TextButton(
                onPressed: () {},
                child: Text(
                  'Passer',
                  style: TextStyle(color: Colors.white),
                ),
              )
            :
              Text(''),
              ),
            Center(
              
              //alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset(
                  pages[currentIndex].backgroundImage,
                  fit: BoxFit.contain,
                  width: 300,
                  height: 250,
                ),
                SizedBox(height: 50,) ,
                TitleOption(data: pages[currentIndex].title, color: Colors.black, size: 18, weight: FontWeight.w500),
                SizedBox(height: 20,) ,
                TitleOption(data: pages[currentIndex].description, color: Colors.black, size: 14, weight: FontWeight.w400 ,textAlign: TextAlign.center,),
                SizedBox(height: 50,) ,
 
              Align(
                alignment: Alignment.center,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      for (int i = 0; i < pages.length; i++)
                      Container(
                          margin: EdgeInsets.all(4.0),
                          width: i == currentIndex ? 25.0 : 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: i == currentIndex
                                ? AppColors.jaune
                                : AppColors.jaune,
                          ),
                        ),
                      
                    
                    ],
                  )
                  ]),
              ),
              SizedBox(height: 20,),
              TextButton(
                onPressed: (){
                   if (currentIndex < pages.length - 1) {
                    setState(() {
                      currentIndex++;
                    });
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  }
                }, 
                child: Text(
                  currentIndex == pages.length - 1 ? 'Commencer' : 'Suivant',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      overflow: TextOverflow.clip,
                    ),
                  ),)
              )
                ],
              ),
             
            )
              
              
            ],
          ),

        )
      ),
    );
   /*  return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            height: height - height / 3 + 100,
            child: Image.asset(
              pages[currentIndex].backgroundImage,
              fit: BoxFit.cover,
              width: width,
              height: height,
            ),
          ),
          Positioned(
            top: 20,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    for (int i = 0; i < pages.length; i++)
                      Container(
                        margin: EdgeInsets.all(2.0),
                        width: 20.0,
                        height: 3.0,
                        decoration: BoxDecoration(
                          color: i == currentIndex ? Colors.white : Colors.grey,
                        ),
                      ),
                  ],
                ),
                if (currentIndex != pages.length - 1)
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Passer',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                else
                  Text(''),
              ],
            ),
          ),
          Positioned.fill(
            top: height - height / 3,
            child: Container(
              //color: Colors.red,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              height: 300,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /* Align(
                          alignment: Alignment.center,
                          child: TitleOption(
                            data: pages[currentIndex].title,
                            color: AppColors.marron,
                            size: 24,
                            weight: FontWeight.bold,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            fontFamily: 'SFProDisplay',
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(
                        width: 2,
                      ),
                      (currentIndex == 2)
                          ? Align(
                              alignment: Alignment.center,
                              child: TitleOption(
                                data: 'SamaTER',
                                color: AppColors.beige,
                                size: 24,
                                weight: FontWeight.normal,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                fontFamily: 'SFProDisplay',
                                textAlign: TextAlign.center,
                                style: FontStyle.italic,
                              ))
                          : Text(''), */
                    ],
                  ),
                  SizedBox(height: 16.0),
                 /*  Align(
                      alignment: Alignment.center,
                      child: TitleText(
                        data: pages[currentIndex].description,
                        color: Colors.black,
                        size: 15,
                        weight: FontWeight.w500,
                        maxLines: 3,
                        overflow: TextOverflow.clip,
                        fontFamily: 'Poppins',
                        textAlign: TextAlign.center,
                      )), */
                 /*  SizedBox(height: 32.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (currentIndex != 0)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            tapTargetSize: MaterialTapTargetSize
                                .shrinkWrap, // Remove click animation
                           // onPrimary: Color.fromRGBO(245, 245, 245, 1),
                            backgroundColor: Color.fromRGBO(245, 245, 245, 1),
                            minimumSize: Size(width / 2 - 5, 50),
                            maximumSize: Size(width / 2 - 5, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              currentIndex--;
                            });
                          },
                          child: TitleText(
                              data: 'Precedent',
                              color: AppColors.marron,
                              size: 18,
                              weight: FontWeight.normal,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              fontFamily: 'Poppins'),
                        ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.marron,
                          minimumSize: Size(
                            currentIndex == 0 ? width * 3 / 4 : width / 2 - 20,
                            50,
                          ),
                          maximumSize: Size(
                            currentIndex == 0 ? width * 3 / 4 : width / 2 - 20,
                            50,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onPressed: () {
                          if (currentIndex < pages.length - 1) {
                            setState(() {
                              currentIndex++;
                            });
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Welcome()));
                          }
                        },
                        child: Text(
                            currentIndex == pages.length - 1
                                ? 'Terminer'
                                : 'Suivant',
                            style: GoogleFonts.getFont('Poppins',
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  overflow: TextOverflow.clip,
                                ))),
                      ),
                    ],
                  ),
                 */],
              ),
            ),
          ),
        ],
      ),
    );
   */}
}

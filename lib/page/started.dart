import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../helper/constant.dart';
import '../widgets/appbar.dart';

class StartedPage extends StatelessWidget {
  final PageController controller = PageController(); // Créez un contrôleur de page

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:  Scaffold(
        appBar: CustomAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 500,
                child: PageView(
                  controller: controller,
                  children: [
                    Column(
                       children: [
                        SizedBox(height: 20.0),
                        Image.asset(
                          "images/started.png", // Replace with the path to your image
                          width: 300,
                          height: 250,
                        ),
                        SizedBox(height: 80.0),
                         Center(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text(
                                 'Consult Specialist Doctors Securely And Privately',
                                 style: TextStyle(
                                   fontSize: 30.0,
                                   fontWeight: FontWeight.bold,
                                 ),
                                 textAlign: TextAlign.center,
                               ),
                               SizedBox(height: 30),
                               Text(
                                 'Lorem ipsum dolor sit amet, consectetur '
                                     'adipiscing elit. Malesuada vulputate'
                                     ' facilisi eget neque, nunc suspendisse '
                                     'massa augue. Congue sit augue volutpat vel.'
                                     ' Dictum dignissim ac pharetra',
                                 style: TextStyle(
                                   fontSize: 12.0, // Personnalisez la taille de la police
                                   fontWeight: FontWeight.normal, // Personnalisez le poids de la police
                                   color: Colors.grey, // Personnalisez la couleur du texte
                                 ),
                                 textAlign: TextAlign.center, // Alignez le texte au centre
                               ),
                             ],
                           ),
                         )
                       ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 20.0),
                        Image.asset(
                          "images/p2.png", // Replace with the path to your image
                          width: 300,
                          height: 250,
                        ),
                        SizedBox(height: 80.0),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Easily schedule appointments with your preferred doctors at your convenience.',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              Text(
                                'Easily manage appointments, messages, and medical records in one convenient location',
                                style: TextStyle(
                                  fontSize: 12.0, // Personnalisez la taille de la police
                                  fontWeight: FontWeight.normal, // Personnalisez le poids de la police
                                  color: Colors.grey, // Personnalisez la couleur du texte
                                ),
                                textAlign: TextAlign.center, // Alignez le texte au centre
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 20.0),
                        Image.asset(
                          "images/1.png", // Replace with the path to your image
                          width: 300,
                          height: 250,
                        ),
                        SizedBox(height: 80.0),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Have control over who accesses your health information.',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              Text(
                                'Customize privacy settings to ensure that only authorized individuals have access to your medical data',
                                style: TextStyle(
                                  fontSize: 12.0, // Personnalisez la taille de la police
                                  fontWeight: FontWeight.normal, // Personnalisez le poids de la police
                                  color: Colors.grey, // Personnalisez la couleur du texte
                                ),
                                textAlign: TextAlign.center, // Alignez le texte au centre
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    // Add more PageView items as needed
                  ],
                ),
              ),
              SizedBox(height: 30),
              SmoothPageIndicator(
                controller: controller,
                count: 3, // Replace with the total number of pages
                effect: WormEffect( activeDotColor: Colors.green ),

              ),
              SizedBox(height: 30),
              Container(
                height: 55,
                width: 330,
                decoration: BoxDecoration(
                  color: Constant().primaryColor,
                  borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/RegistrationPage');
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18// Set the text color
                    ),
                  ),
                ),
              )

              ,
            ],
          ),

        ),
      ),

      ),

    );
  }
}

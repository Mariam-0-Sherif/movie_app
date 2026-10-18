import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_routes.dart';
import 'package:movie_app/utils/size_utils.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();

  // el index bta3 el screen elly mfto7a delwa2ty
  int index = 0;

  // function mo5tasara bta5od raqam el Figma w trg3o 3ala 7asab 3ard el screen
  double w(double value) => SizeUtils.getWidth(context, value);

  // nafs el fekra bas lel tool
  double h(double value) => SizeUtils.getHeight(context, value);

  // soor el 6 screens bel tarteeb
  List<String> images = [
    'assets/images/OnBoarding_1.png',
    'assets/images/OnBoarding_2.png',
    'assets/images/OnBoarding_3.png',
    'assets/images/OnBoarding_4.png',
    'assets/images/OnBoarding_5.png',
    'assets/images/OnBoarding_6.png',
  ];

  // el 3anawen bel tarteeb (el \n 3ashan el kalam yenzel satr gded zay el Figma)
  List<String> titles = [
    'Find Your Next\nFavorite Movie Here',
    'Discover Movies',
    'Explore All Genres',
    'Create Watchlists',
    'Rate, Review, and Learn',
    'Start Watching Now',
  ];

  // el wasf bel tarteeb (el screen el akhira fadya)
  List<String> descriptions = [
    'Get access to a huge library of movies to suit all tastes. You will surely like it.',
    'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
    'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
    'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
    'Share your thoughts on the movies you have watched. Dive deep into film details and help others discover great movies with your reviews.',
    '',
  ];

  // zorar Next: lw e7na fe a5er screen nroo7 lel login, gher keda nenta2el lel screen elly ba3daha
  void next() {
    if (index == images.length - 1) {
      Navigator.pushReplacementNamed(context, AppRoutes.loginRouteName);
    } else {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // zorar Back: yrg3 screen wa7da le wara
  void back() {
    controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // lazem nfaddy el controller lama el screen telfa
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // el nas elly 3ala el zorar el asfar: awel screen Explore Now, a5er wa7da Finish, el baqi Next
    String buttonText = 'Next';
    if (index == 0) {
      buttonText = 'Explore Now';
    } else if (index == images.length - 1) {
      buttonText = 'Finish';
    }

    return Scaffold(
      body: Stack(
        children: [
          // el soor bta3et el khalfeya, el user y3mel swipe benhom
          PageView.builder(
            controller: controller,
            itemCount: images.length,
            onPageChanged: (value) {
              index = value;
              setState(() {});
            },
            itemBuilder: (context, i) {
              return Image.asset(
                images[i],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),

          // el panel elly ta7t, Align bey7oto fe a5er el screen
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(
                w(16),
                index == 0 ? h(100) : h(28),
                w(16),
                h(24),
              ),
              decoration: BoxDecoration(
                // awel screen feha fade, el baqi feha sheet eswed
                color: index == 0 ? null : AppColors.blackColor,
                gradient: index == 0
                    ? const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.transparentColor,
                          AppColors.blackColor,
                        ],
                      )
                    : null,
                borderRadius: index == 0
                    ? null
                    : BorderRadius.vertical(top: Radius.circular(w(40))),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // el 3enwan
                  Text(
                    titles[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: index == 0 ? w(36) : w(24),
                      fontWeight: index == 0
                          ? FontWeight.w500
                          : FontWeight.bold,
                    ),
                  ),

                  // el wasf, bn3rdo bas lw msh fady
                  if (descriptions[index] != '') ...[
                    SizedBox(height: h(16)),
                    Text(
                      descriptions[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.lightGrayColor,
                        fontSize: w(18),
                      ),
                    ),
                  ],

                  SizedBox(height: h(24)),

                  // zorar el next (asfar)
                  SizedBox(
                    width: double.infinity,
                    height: h(56),
                    child: ElevatedButton(
                      onPressed: next,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.yellowColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(w(16)),
                        ),
                      ),
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: w(20),
                        ),
                      ),
                    ),
                  ),

                  // zorar el back, mesh bybyan fel screen el awla
                  if (index != 0) ...[
                    SizedBox(height: h(16)),
                    SizedBox(
                      width: double.infinity,
                      height: h(56),
                      child: OutlinedButton(
                        onPressed: back,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.yellowColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(w(16)),
                          ),
                        ),
                        child: Text(
                          'Back',
                          style: TextStyle(
                            color: AppColors.yellowColor,
                            fontSize: w(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

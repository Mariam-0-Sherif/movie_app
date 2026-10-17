import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_routes.dart';
import 'package:movie_app/utils/size_utils.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();

  int index = 0;

  double w(double value) => SizeUtils.getWidth(context, value);

  double h(double value) => SizeUtils.getHeight(context, value);

  List<String> images = [
    'assets/images/OnBoarding_1.png',
    'assets/images/OnBoarding_2.png',
    'assets/images/OnBoarding_3.png',
    'assets/images/OnBoarding_4.png',
    'assets/images/OnBoarding_5.png',
    'assets/images/OnBoarding_6.png',
  ];

  List<String> titles = [
    'Find Your Next\nFavorite Movie Here',
    'Discover Movies',
    'Explore All Genres',
    'Create Watchlists',
    'Rate, Review, and Learn',
    'Start Watching Now',
  ];

  List<String> descriptions = [
    'Get access to a huge library of movies to suit all tastes. You will surely like it.',
    'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
    'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
    'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
    'Share your thoughts on the movies you have watched. Dive deep into film details and help others discover great movies with your reviews.',
    '',
  ];

  void next() {
    if (index == images.length - 1) {
      Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
    } else {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void back() {
    controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String buttonText = 'Next';
    if (index == 0) {
      buttonText = 'Explore Now';
    } else if (index == images.length - 1) {
      buttonText = 'Finish';
    }

    return Scaffold(
      body: Stack(
        children: [
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
                color: index == 0 ? null : const Color(0xFF121312),
                gradient: index == 0
                    ? const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Color(0xFF121312)],
                      )
                    : null,
                borderRadius: index == 0
                    ? null
                    : BorderRadius.vertical(top: Radius.circular(w(40))),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    titles[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: index == 0 ? w(36) : w(24),
                      fontWeight: index == 0
                          ? FontWeight.w500
                          : FontWeight.bold,
                    ),
                  ),

                  if (descriptions[index] != '') ...[
                    SizedBox(height: h(16)),
                    Text(
                      descriptions[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: w(18)),
                    ),
                  ],

                  SizedBox(height: h(24)),

                  SizedBox(
                    width: double.infinity,
                    height: h(56),
                    child: ElevatedButton(
                      onPressed: next,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFBB3B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(w(16)),
                        ),
                      ),
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          color: const Color(0xFF121312),
                          fontSize: w(20),
                        ),
                      ),
                    ),
                  ),

                  if (index != 0) ...[
                    SizedBox(height: h(16)),
                    SizedBox(
                      width: double.infinity,
                      height: h(56),
                      child: OutlinedButton(
                        onPressed: back,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFFFBB3B)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(w(16)),
                          ),
                        ),
                        child: Text(
                          'Back',
                          style: TextStyle(
                            color: const Color(0xFFFFBB3B),
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

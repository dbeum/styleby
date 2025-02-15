import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  bool _isInView = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    // Check if the scroll position has reached a certain point
    if (_scrollController.offset >= 100 && !_isInView) {
      setState(() {
        _isInView = true;
      });
    } else if (_scrollController.offset < 100 && _isInView) {
      setState(() {
        _isInView = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
  final Uri instagramUrl = Uri.parse('https://www.instagram.com/stylebyoguchi/');

 
  Future<void> _launchInstagram() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(instagramUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $instagramUrl';
    }
  }

final Uri whatsappUrl = Uri.parse('https://wa.me/+2347068613946');

 
  Future<void> _launchwhatsapp() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $whatsappUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
     bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Center(child: Image.asset( isDarkMode ? 'assets/images/styleby11.png' : 'assets/images/styleby22.png' ,)   ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextButton(onPressed:_launchInstagram,
               child: Image.asset('assets/images/instagram.png',height: 30,)),
               TextButton(onPressed:_launchwhatsapp,
               //  _launchInstagram,
               child: Image.asset('assets/images/whatsapp.png',height: 30,))
             ]
              )
            ,
            const SizedBox(height: 100),
            
            CarouselSlider(
                    options: CarouselOptions(
                      height: 400.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
            items:[
      Center(
          child: Image.asset('assets/images/fit1.png'),
        ),
                    Center(
          child: Image.asset('assets/images/fit2.png'),
        ),
                 Center(
          child: Image.asset('assets/images/fit3.png'),
        ),
                 Center(
          child: Image.asset('assets/images/fit4.png'),
        )
       ],
        ),
            const SizedBox(height: 100),
            if (_isInView) // Show only when in view
              WidgetAnimator(
                incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(),
                atRestEffect: WidgetRestingEffects.swing(),
                child: FloatingActionButton(
                  onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title:   Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 10.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/brain.png',
                  ),
                ),
                  content: Column(children:[
                    Text('About Me',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                       Text('Hey there! I’m Oguchi, the founder of Style by—a clothing brand driven by a love for style, quality, and self-expression. I started this brand to create pieces that don’t just look good but also make you feel amazing every time you wear them.At Style by, each design is crafted with attention to detail, aiming to blend comfort, versatility, and individuality.'),
                  ]),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Closes the dialog
                      },
                      child: Text(''),
                    ),
                  ],
                );
              },
            );
          },
                  tooltip: 'About Me',
                  child: const Icon(Icons.add),
                ),
              ),
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon(Icons.shopping_cart_checkout),
                Text('Delivery Nationwide(NG)'),
                
              ],),
              const SizedBox(height: 20),
        
        
        ],
        ),
      ),
    );
  }
}

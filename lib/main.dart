import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scrollController = ScrollController();

  void onLister() {
    //print('Scroller Controller: ${scrollController.offset}');
    setState(() {});
  }

  @override
  void initState() {
    scrollController.addListener(onLister);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onLister);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List content = [
      {
        'Name':
            'A title that suggests excitement and enthusiasm for all things feline.',
        'images':
            'https://images.pexels.com/photos/1741205/pexels-photo-1741205.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      },
      {
        'Name':
            'A play on the word “perfect” and “paws,” emphasizing the feline theme',
        'images':
            'https://images.pexels.com/photos/821736/pexels-photo-821736.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      },
      {
        'Name':
            'A fun and catchy title that suggests a mix of cat-related content.',
        'images':
            'https://images.pexels.com/photos/3687957/pexels-photo-3687957.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      },
      {
        'Name': 'Evokes a sense of adventure and exploration for cat lovers',
        'images':
            'https://images.pexels.com/photos/5984541/pexels-photo-5984541.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      },
      {
        'Name': 'Perfect for an app focused on cat videos and entertainment',
        'images':
            'https://images.pexels.com/photos/1687831/pexels-photo-1687831.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      },
      {
        'Name': 'Discover a world of adorable cats!',
        'images':
            'https://images.pexels.com/photos/1314550/pexels-photo-1314550.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      },
      {
        'Name': 'CatSnap brings you the cutest feline photos and videos',
        'images':
            'https://images.pexels.com/photos/2071882/pexels-photo-2071882.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      },
      {
        'Name': 'Swipe through fluffy kittens, playful tabbies',
        'images':
            'https://images.pexels.com/photos/1687831/pexels-photo-1687831.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      },
    ];
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          'Articles',
          style: TextStyle(
              letterSpacing: 2,
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(244, 233, 254, 1),
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Saved',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                              letterSpacing: 1),
                          border: InputBorder.none, // Remove the underline
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16), // Add some padding
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: ImageIcon(AssetImage('assets/save-instagram.png')),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 700,
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: <Widget>[
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                      childCount: content.length,
                      (context, index) {
                        final itemPositionOffset = index * 140;
                        final difference =
                            scrollController.offset - itemPositionOffset;
                        final percentage = 1 - (difference / 140);
                        double opacity = percentage;
                        double scale = percentage;
                        if (opacity > 1.0) opacity = 1.0;
                        if (opacity < 0.0) opacity = 0.0;
                        if (percentage > 1.0) scale = 1.0;
                        return Opacity(
                          opacity: opacity,
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..scale(scale, 1.0),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        const Color.fromRGBO(244, 233, 254, 1)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          content[index]['images'],
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: 200,
                                            height: 120,
                                            //padding: const EdgeInsets.all(10),

                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  content[index]['Name'],
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Spacer(),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    ImageIcon(AssetImage(
                                                        'assets/save-instagram.png')),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ))
                  ],
                ),
              ),
              // ListView.separated(
              //   separatorBuilder: (context, index) => const SizedBox(
              //     height: 10,
              //   ),
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: content.length,
              //   itemBuilder: (context, index) {
              //     return Container(
              //       height: 150,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(20),
              //           color: const Color.fromRGBO(244, 233, 254, 1)),
              //       child: Row(
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: ClipRRect(
              //               borderRadius: BorderRadius.circular(10),
              //               child: Image.network(
              //                 content[index]['images'],
              //                 width: 150,
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.all(10),
              //             child: Column(
              //               children: [
              //                 SizedBox(
              //                   width: 200,
              //                   height: 120,
              //                   //padding: const EdgeInsets.all(10),

              //                   child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Text(
              //                         content[index]['Name'],
              //                         maxLines: 2,
              //                         overflow: TextOverflow.ellipsis,
              //                         style: TextStyle(
              //                           fontSize: 16,
              //                           color: Colors.black,
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                       Spacer(),
              //                       Row(
              //                         mainAxisAlignment: MainAxisAlignment.end,
              //                         children: [
              //                           ImageIcon(AssetImage(
              //                               'assets/save-instagram.png')),
              //                         ],
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

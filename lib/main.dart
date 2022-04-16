import 'package:flutter/material.dart';
import 'package:video_js/video_js.dart';

void main() {
  // this line need for javascript's call backs
  VideoJsResults().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OptionsPage(),
    );
  }
}

class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  OptionsPageState createState() => OptionsPageState();
}

class OptionsPageState extends State<OptionsPage> {
  bool? controls = true;
  bool? loop = false;
  bool? muted = false;
  String? poster =
      'https://file-examples-com.github.io/uploads/2017/10/file_example_JPG_100kB.jpg';
  String? aspectRatio = '16:9';
  bool? fluid = false;
  String? language = 'en';
  bool? liveui = false;
  String? notSupportedMessage = 'this movie type not supported';
  String? source =
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
  String? sourceType = "video/mp4";
  List<double>? playbackRates = [1, 2, 3];
  bool? preferFullWindow = false;
  bool? responsive = false;

  // List<Source>? sources = [];
  bool? suppressNotSupportedError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("videoJs Options"),
      ),
      body: ListView(
        children: [
          CheckboxListTile(
            title: const Text("controls"),
            value: controls,
            onChanged: (val) {
              setState(() {
                controls = val;
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),
          CheckboxListTile(
            title: const Text("loop"),
            value: loop,
            onChanged: (val) {
              setState(() {
                loop = val;
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),
          CheckboxListTile(
            title: const Text("muted"),
            value: muted,
            onChanged: (val) {
              setState(() {
                muted = val;
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),
          CheckboxListTile(
            title: const Text("fluid"),
            value: fluid,
            onChanged: (val) {
              setState(() {
                fluid = val;
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),
          CheckboxListTile(
            title: const Text("liveui"),
            value: liveui,
            onChanged: (val) {
              setState(() {
                liveui = val;
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),
          CheckboxListTile(
            title: const Text("preferFullWindow"),
            value: preferFullWindow,
            onChanged: (val) {
              setState(() {
                preferFullWindow = val;
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),
          CheckboxListTile(
            title: const Text("responsive"),
            value: responsive,
            onChanged: (val) {
              setState(() {
                responsive = val;
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),
          CheckboxListTile(
            title: const Text("suppressNotSupportedError"),
            value: suppressNotSupportedError,
            onChanged: (val) {
              setState(() {
                suppressNotSupportedError = val;
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),
          ListTile(
            leading: const Text("poster"),
            title: TextField(
              controller: TextEditingController(text: poster),
              onChanged: (val) {
                poster = val;
              },
            ),
          ),
          ListTile(
            leading: const Text("aspectRatio"),
            title: TextField(
              controller: TextEditingController(text: aspectRatio),
              onChanged: (val) {
                aspectRatio = val;
              },
            ),
          ),
          ListTile(
            leading: const Text("language"),
            title: TextField(
              controller: TextEditingController(text: language),
              onChanged: (val) {
                language = val;
              },
            ),
          ),
          ListTile(
            leading: const Text("notSupportedMessage"),
            title: TextField(
              controller: TextEditingController(text: notSupportedMessage),
              onChanged: (val) {
                notSupportedMessage = val;
              },
            ),
          ),
          ListTile(
            leading: const Text("source"),
            title: TextField(
              controller: TextEditingController(text: source),
              onChanged: (val) {
                source = val;
              },
            ),
          ),
          ListTile(
            leading: const Text("source type"),
            title: TextField(
              controller: TextEditingController(text: sourceType),
              onChanged: (val) {
                sourceType = val;
              },
            ),
          ),
          ListTile(
            leading: const Text("playbackRates"),
            title: TextField(
              controller: TextEditingController(text: '1,2,3'),
              onChanged: (val) {
                playbackRates!.clear();
                val.split(',').forEach((element) {
                  if (element != '')
                    playbackRates!.add(int.parse(element).toDouble());
                });
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            videoJsOptions: VideoJsOptions(
                                controls: controls,
                                loop: loop,
                                muted: muted,
                                poster: poster,
                                aspectRatio: aspectRatio,
                                fluid: fluid,
                                language: language,
                                liveui: liveui,
                                notSupportedMessage: notSupportedMessage,
                                playbackRates: playbackRates,
                                preferFullWindow: preferFullWindow,
                                responsive: responsive,
                                sources: [
                                  Source(
                                      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                                      "video/mp4")
                                ],
                                suppressNotSupportedError:
                                    suppressNotSupportedError),
                          )),
                );
              },
              child: const Text(
                "Navigate to video page",
                style: TextStyle(color: Colors.white),
              )),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final VideoJsOptions videoJsOptions;

  const MyHomePage({Key? key, required this.videoJsOptions}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String playerId = "videoId";
  TextEditingController videoSourceController = TextEditingController();
  TextEditingController videoTypeController = TextEditingController();
  late VideoJsController videoJsController;

  @override
  void initState() {
    super.initState();
    videoSourceController.text =
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
    videoTypeController.text = "video/mp4";
    videoJsController =
        VideoJsController("videoId", videoJsOptions: widget.videoJsOptions);
  }

  @override
  void dispose() {
    super.dispose();
    // videoJsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("videojs example"),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VideoJsWidget(
                    videoJsController: videoJsController,
                    height: MediaQuery.of(context).size.width / 2.5,
                    width: MediaQuery.of(context).size.width / 1.5,
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: TextField(
                      controller: videoSourceController,
                      decoration: const InputDecoration(hintText: "video"),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: TextField(
                      controller: videoTypeController,
                      decoration: const InputDecoration(hintText: "type"),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        //[type] can be video/mp4, video/webm, application/x-mpegURL (for hls videos) , ...
                        videoJsController.setSRC(
                            videoSourceController.text.toString(),
                            type: videoTypeController.text.toString());
                      },
                      child: const Text(
                        "set source",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        videoJsController.play();
                      },
                      child: const Text(
                        "play",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        videoJsController.pause();
                      },
                      child: const Text(
                        "pause",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        videoJsController.isPaused((val) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(milliseconds: 500),
                              content: Text(
                                "Pause status : $val",
                                style: const TextStyle(color: Colors.white),
                              )));
                        });
                      },
                      child: const Text(
                        "is pause",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        videoJsController.currentTime((val) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(milliseconds: 500),
                              content: Text(
                                "Current video time : $val",
                                style: const TextStyle(color: Colors.white),
                              )));
                        });
                      },
                      child: const Text(
                        "Current video time",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        videoJsController.getVolume((val) =>
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: const Duration(milliseconds: 500),
                                content: Text(
                                  "volume is : $val",
                                  style: const TextStyle(color: Colors.white),
                                ))));
                      },
                      child: const Text(
                        "Get volume",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        videoJsController.setVolume("0.5");
                      },
                      child: const Text(
                        "Set volume to 0.5",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        videoJsController.toggleMute();
                      },
                      child: const Text(
                        "Toggle mute",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        videoJsController.isMute((val) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(milliseconds: 500),
                              content: Text(
                                "Mute status : $val",
                                style: const TextStyle(color: Colors.white),
                              )));
                        });
                      },
                      child: const Text(
                        "Mute status",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        videoJsController.toggleFullScreen();
                      },
                      child: const Text(
                        "Toggle Full Screen",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        videoJsController.isFullScreen((val) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(milliseconds: 500),
                              content: Text(
                                "Full screen status : $val",
                                style: const TextStyle(color: Colors.white),
                              )));
                        });
                      },
                      child: const Text(
                        "Full screen status",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        videoJsController.requestFullScreen();
                      },
                      child: const Text(
                        "request full screen",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        videoJsController.exitFullScreen();
                      },
                      child: const Text(
                        "exite Full Screen",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        videoJsController.setCurrentTime("100");
                      },
                      child: const Text(
                        "Set video time to 100 sec",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        videoJsController.durationTime((val) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(milliseconds: 500),
                              content: Text(
                                "Duration time : $val",
                                style: const TextStyle(color: Colors.white),
                              )));
                        });
                      },
                      child: const Text(
                        "Duration",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        videoJsController.remainTime((val) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(milliseconds: 500),
                              content: Text(
                                "Remain time : $val",
                                style: const TextStyle(color: Colors.white),
                              )));
                        });
                      },
                      child: const Text(
                        "Remain time",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        videoJsController.bufferPercent((val) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(milliseconds: 500),
                              content: Text(
                                "Buffer percent : $val",
                                style: const TextStyle(color: Colors.white),
                              )));
                        });
                      },
                      child: const Text(
                        "Buffer percent",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        videoJsController.setPoster(
                            "https://file-examples-com.github.io/uploads/2017/10/file_example_JPG_100kB.jpg");
                      },
                      child: const Text(
                        "Set video poster",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        videoJsController.getPoster((val) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(milliseconds: 500),
                              content: Text(
                                "Video poster : $val",
                                style: const TextStyle(color: Colors.white),
                              )));
                        });
                      },
                      child: const Text(
                        "Get video poster",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        )));
  }
}

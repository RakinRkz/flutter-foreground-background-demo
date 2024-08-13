import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class MyApp extends StatefulWidget {
  const MyApp ({Key? key})  : super (key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String str = 'stop';
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('service demo app'),
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: () {
              FlutterBackgroundService().invoke('setAsForeground');
            }, 
              child: const Text('set as foreground'),
            ),
            ElevatedButton(onPressed: () {
              FlutterBackgroundService().invoke('setAsBackground');
            }, 
              child: const Text('set as background'),
            ),
            ElevatedButton(
              onPressed: () async{
                final service = FlutterBackgroundService();
                var isRunning = await service.isRunning();

                if (isRunning){
                  service.invoke('stopService');
                  str = 'start';
                }
                else{
                  service.startService();
                  str = 'stop';
                }

                setState(() {});

              },
              child: Text(str)),

          ],
        ),
      ),
    );
  }
}
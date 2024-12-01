import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webview_all/webview_all.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Screen1(),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('Text to Braille'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Center(
        child: Webview(url: "https://crocsg.github.io/BrailleRap/"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screen1()));
          } else if (index == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screen3()));
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'Braille',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
        ],
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  Future<void> _openCamera() async {
    try {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        print("Photo captured: ${photo.path}"); // Handle the captured photo
      }
    } catch (e) {
      print("Error opening camera: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      appBar: AppBar(
        title: Text('Camera'),
        backgroundColor: Colors.teal.shade200,
        elevation: 0,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openCamera, // Open the camera
          child: Text(
            'Insert image',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screen1()));
          } else if (index == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screen3()));
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'Braille',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
        ],
      ),
    );
  }
}

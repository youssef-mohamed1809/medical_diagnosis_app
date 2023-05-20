import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

// import 'dart:io';

import 'package:cross_file/src/types/interface.dart';
import 'package:flutter/material.dart';

// class ResultScreen extends StatelessWidget {

//   // void initState(){
//   //   sendData();
//   // }

// }

//ElevatedButton(onPressed: sendImage, child: const Text("show"))

class ResultScreen extends StatefulWidget {
  String scanType = "";
  File image;
  String xrayIllness = "";
  double xrayPercentage = -1;

  String tumorPresent = "";
  List<double>? percentages;

  ResultScreen(this.scanType, this.image, {super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  void getData() async {
    String url = "http://192.168.1.188:105/getResults?scantype=MRI";
    final response = await http.get(Uri.parse(url));

    // print(response);

    var responseData = json.decode(response.body);

    print(responseData);

    //sleep(new Duration(seconds: 5));

    setState(() {
      if (widget.scanType == "XRay") {
        widget.xrayIllness = responseData['illness'] as String;
        widget.xrayPercentage = responseData['percentage'] as double;
      } else {
        widget.tumorPresent = responseData['tumorPresent'] as String;
        widget.percentages = responseData['percentages'] as List<double>;
      }
    });
  }

  void sendData() async {
    var url = Uri.parse('http://192.168.1.188:105/sendData');

    // open the image file
    var stream = http.ByteStream(widget.image.openRead());
    // get the length of the image file
    var length = await widget.image.length();

    // create a multipart request
    var request = http.MultipartRequest("POST", url);

    // add the image file to the request
    var multipartFile =
        http.MultipartFile('file', stream, length, filename: "myImg.jpg");
    request.files.add(multipartFile);
    request.fields['scantype'] = widget.scanType;

    // send the request
    var response = await request.send();
    if (response.statusCode == 200) {
      // request successful
      print("Image sent successfully");
    } else {
      // request failed
      print("Error sending image: ${response.statusCode}");
    }

    //sleep(new Duration(seconds: 5));

    getData();
  }

  @override
  void initState() {
    sendData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.scanType == "XRay"
          ? XRay(widget.xrayIllness, widget.xrayPercentage)
          : MRI(widget.tumorPresent, widget.percentages as List<double>),
    );
  }
}

class XRay extends StatelessWidget {
  String? xrayIllness;
  double? xrayPercentage;
  XRay(this.xrayIllness, this.xrayPercentage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(xrayIllness as String)],
    );
  }
}

class MRI extends StatelessWidget {
  String tumorPresent;
  List<double> percentages;
  MRI(this.tumorPresent, this.percentages, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(tumorPresent), Text(percentages as String)],
    );
  }
}

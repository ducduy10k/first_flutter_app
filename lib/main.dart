import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Title aaaaa a   ',
            // maxLines: 1,
            // overflow: TextOverflow.ellipsis,
          ),
          backgroundColor: Colors.blue,
          centerTitle: false,
        ),
        body: body()),
  ));
}

class body extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: double.infinity,
      height: 250,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Text("body content"),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey,
            width: 10,
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignInside),
        color: Colors.green,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.pink,
            offset: Offset(8, 8),
            blurRadius: 10,
          )
        ],

        // borderRadius: BorderRadius.circular(16)
      ),
      // transform: Matrix4.rotationZ(30),
    ));
  }
}

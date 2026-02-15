import 'package:flutter/material.dart';

class SingInScren extends StatefulWidget {
  const SingInScren({super.key});

  @override
  State<SingInScren> createState() => _SingInScrenState();
}

class _SingInScrenState extends State<SingInScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Sing to Cartet Acccoutn',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Text(
                'HI my Name is ferus hossanand waht is iou anem  ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 50),
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.visibility), // suffix icon

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.grey, // normal border color
                    width: 1.5,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.orange, // active/focused border color
                    width: 2,
                  ),
                ),
              ),
            ),

            SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(1111),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Or Login With',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(1111),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),

            Center(
              child: Row(
                mainAxisSize:
                    MainAxisSize.min, // Row কে content size অনুযায়ী রাখবে
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey),
                    ),
                    padding: EdgeInsets.all(22),
                    child: Icon(Icons.gps_off_outlined, color: Colors.blue),
                  ),

                  SizedBox(width: 16), // spacing

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey),
                    ),
                    padding: EdgeInsets.all(22),
                    child: Icon(Icons.gps_off_outlined, color: Colors.blue),
                  ),
                ],
              ),
            ),

            SizedBox(height: 100),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // main button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // round corners
                  ),
                  elevation: 4, // shadow
                ).copyWith(
                  // hover color
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) return Colors.blue.shade700;
                      if (states.contains(MaterialState.pressed)) return Colors.blue.shade900;
                      return null; // default
                    },
                  ),
                ),
                child: Text(
                  'Sign',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

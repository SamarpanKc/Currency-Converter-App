import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget{
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState  extends State<CurrencyConverter>{

  final blackColor = Color(0xff131112);
  final whiteColor = Color.fromARGB(210, 247, 247, 255);
  final bgColor = Color(0xff9F84BD);
  
  double converted = 0;
  TextEditingController inputValue= TextEditingController();


  @override
  Widget build(BuildContext context){
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(45)),
      borderSide: BorderSide(
        width: 2.0,
        strokeAlign: BorderSide.strokeAlignCenter,
      ),
    );

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text("CURRECNY CONVERTER"),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 18,
          color: blackColor,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Text(
                    'NRP ${converted.toString()}', //converted Display 0.0
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: TextField(
                controller: inputValue,
                
                // onSubmitted: (value) => {
                //   print(value),
                // },
                
                style: TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: "Enter amount in USD",
                  hintStyle: TextStyle(color: blackColor),
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: blackColor,
                  filled: true,
                  fillColor: whiteColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: border,
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: TextButton(
                onPressed: () {
                  try {
                    setState(() {
                      converted = double.parse(inputValue.text) * 138.98;
                      converted = double.parse(converted.toStringAsFixed(3));
                    });
                  } catch (e) {
                    // Handle the exception, e.g., show an error message
                    print("Invalid input: ${inputValue.text}");
                    // You might want to display an error message to the user using a SnackBar or AlertDialog
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Invalid input. Please enter a valid number.'),
                      ),
                    );
                  }
                }
                ,
                style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  backgroundColor: blackColor,
                  foregroundColor: whiteColor,
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  padding: EdgeInsets.fromLTRB(32, 8, 32, 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Convert"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
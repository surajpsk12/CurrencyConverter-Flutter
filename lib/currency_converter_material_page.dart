import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget { // stateful widgets allows to change but stateless widgets do not
  const CurrencyConverterMaterialPage({super.key});
  @override
  State<CurrencyConverterMaterialPage> createState() => _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage> {
  @override
  void initState() {
    super.initState();
  }

  void convert(){
    result = double.parse(textEditingController.text)*86;
    setState(() {});
  }

  double result = 0;
  final TextEditingController textEditingController  = TextEditingController(); // to detect changes in text field

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(5),
    );
    return  Scaffold(
        backgroundColor: Color(0xFF6C5CE7), // Modern purple background
        appBar: AppBar(
          backgroundColor: Color(0xFF6C5CE7), // Same purple for app bar
          elevation: 0,
          title: Center(
            child: Text('Currency Converter',style:TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ // all children in screen or widgets
              Text( // text or result field
                  'INR ${result != 0 ? result.toStringAsFixed(2):result.toStringAsFixed(0)}' ,// set result to result text to show answers
                  style:const TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(// input field , take input from user
                  controller: textEditingController, // record changes or text from this input field
                  style: const TextStyle(
                      color: Color(0xFF2D3436) // Dark text in input
                  ),
                  decoration: InputDecoration(
                    hintText: 'Please enter the amount in USD',
                    hintStyle: const TextStyle(
                        color: Color(0xFF636e72) // Gray hint text
                    ),
                    prefixIcon: const Icon(Icons.monetization_on_outlined),
                    prefixIconColor: Color(0xFF6C5CE7), // Purple icon
                    filled: true,
                    fillColor: Colors.white, // White input field
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
              // buttons in ui
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                    convert(); // calling function on click
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF2D3436), // Dark gray button
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Convert'),
                ),
              ),
            ],
          ),
        )
    );
  }
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
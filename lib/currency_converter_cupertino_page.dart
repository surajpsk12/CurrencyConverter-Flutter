import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() => _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState extends State<CurrencyConverterCupertinoPage> {
  void convert(){
    result = double.parse(textEditingController.text)*86;
    setState(() {});
  }
  double result = 0;
  final TextEditingController textEditingController  = TextEditingController(); // to detect changes in text field

  @override
  Widget build(BuildContext context) {

    return  CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGrey3,
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemGrey3,
          middle: Center(
            child: Text('Currency Converter',style:TextStyle(
              color: CupertinoColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ // all children in screen or widgets
              Text( // text or result field
                  'INR ${result != 0 ? result.toStringAsFixed(2):result.toStringAsFixed(0)}' ,// set result to result text to show answers
                  style:const TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CupertinoTextField(// input field , take input from user
                  controller: textEditingController, // record changes or text from this input field
                  style: const TextStyle(
                      color: CupertinoColors.black
                  ),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  placeholder: 'Please enter the amount in USD',
                  prefix: const Icon(CupertinoIcons.money_dollar),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
              // buttons in ui
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CupertinoButton(
                  onPressed: () {
                    convert(); // calling function on click
                  },
                  color: CupertinoColors.black,
                  child: const Text('Convert'),
                ),
              ),
            ],
          ),
        )
    );
  }
}

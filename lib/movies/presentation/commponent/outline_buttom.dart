import 'package:flutter/material.dart';

class FieldOutlineButton extends StatelessWidget {
  const FieldOutlineButton(
      {Key? key,
      required this.generes,
      required this.text,
      required this.press,
      required this.selectGeners})
      : super(key: key);

  final int generes;
  final String text;
  final VoidCallback press;
  final int selectGeners;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: Colors.white, width: 1),
        ),
        onPressed: press,
        elevation: selectGeners == generes ? 5 : 0,
        color: selectGeners == generes ? Theme.of(context).primaryColor : Colors.transparent,
        child: Text(
          text,
          style: TextStyle(
              color: selectGeners == generes
                  ?const Color.fromARGB(255, 126, 125, 125): Theme.of(context).primaryColor,
                 
              fontSize: 12),
        ),
      ),
    );
  }
}

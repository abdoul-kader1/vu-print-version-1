import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String titre; final bool masquerSaisie;final Color couleurBordure;final Widget?suffixIcons;
  final IconData?prefixIcons;final Color?couleurPrexfixeIcons;final TextInputType?textInputType;final Color?couleurPlaceholder;
  final String?Function(String?)?validator;final TextEditingController?controller;
  final Function(String)?onChanged;
  final int?minLine,maxLine;
  const Input({
    super.key,required this.titre,required this.masquerSaisie,required this.couleurBordure,this.suffixIcons, this.prefixIcons,
    this.couleurPrexfixeIcons, this.textInputType, this.couleurPlaceholder,this.validator,this.controller,
    this.onChanged,this.minLine,this.maxLine
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 55,
      child: TextFormField(
        minLines: minLine,
        maxLines: maxLine,
        obscureText: masquerSaisie,
        keyboardType:textInputType,
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        //minLines: minLine,
        decoration: InputDecoration(
          isDense: true,
            labelText: titre,
            labelStyle: TextStyle(color:couleurPlaceholder),
            prefixIcon: Icon(prefixIcons,color: couleurPrexfixeIcons),
            suffixIcon: suffixIcons,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: couleurBordure)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: couleurBordure)
            )
        ),
      ),
    );
  }
}
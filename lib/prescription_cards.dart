import 'package:flutter/material.dart';
import './var.dart';

Container medicine(List<String> dosage, String selecteddosage, var rebetedhours,
    var tobetaken, var course, var type) {
  return Container(
      decoration: BoxDecoration(
          color: globals.w,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(blurRadius: 5)]),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Column(children: [
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: TextEditingController(),
            autovalidateMode: AutovalidateMode.always,
            cursorColor: globals.b,
            style: TextStyle(
              color: globals.b,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'برجاء كتابه اسم الدواء';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'اسم الدواء',
              labelStyle: TextStyle(
                color: globals.b,
              ), //
              focusColor: globals.b,
              fillColor: globals.b,
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: globals.b)),
              border:
                  OutlineInputBorder(borderSide: BorderSide(color: globals.b)),
            ),
          ),
        ),
        const Expanded(
          flex: 2,
          child: Row(
            children: [
              /*   DropdownButton<String>(
                hint: const Text("الكميه"),
                value: selecteddosage,
                  items: dosage.map(( item) =>DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  )
                  ).toList(),
                  onChanged:null ,
                  )*/
            ],
          ),
        ),
        const Expanded(
          flex: 2,
          child: Row(
            children: [],
          ),
        ),
      ]));
}
